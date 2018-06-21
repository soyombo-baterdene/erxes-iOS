//
//  ChannelFilterController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 5/15/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo


protocol ChannelDelegate: class  {
    func getSelectedChannelData(options:FilterOptions)
}

class ChannelFilterController: UIViewController {

    var channels = [ChannelDetail](){
        didSet {
            tableView.reloadData()
        }
    }
    
    var loader: ErxesLoader = {
        let loader = ErxesLoader(frame: CGRect(x: Constants.SCREEN_WIDTH/2-35, y: 125, width: 50, height: 50))
        loader.lineWidth = 3
        return loader
    }()
    
    weak var channelDelegate: ChannelDelegate?
    
    var filterOptions = FilterOptions()

    
    let client: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let currentUser = ErxesUser.sharedUserInfo()
        configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
                                               "x-refresh-token": currentUser.refreshToken as Any]
        let url = URL(string: Constants.API_ENDPOINT + "/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FilterCell.self, forCellReuseIdentifier: "FilterCell")
        tableView.rowHeight = 40
        tableView.tableFooterView = UIView()
        tableView.separatorColor = Constants.ERXES_COLOR
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(loader)
        self.view.backgroundColor = .clear
        getChannels()
    }
    
    func getChannels(){
        loader.startAnimating()
            let query = ChannelsQuery()
            client.fetch(query: query, cachePolicy: CachePolicy.returnCacheDataAndFetch) { [weak self] result, error in
                if let error = error {
                    print(error.localizedDescription)
                    let alert = FailureAlert(message: error.localizedDescription)
                    alert.show(animated: true)
                    self?.loader.stopAnimating()
                    return
                }
                
                if let err = result?.errors {
                    let alert = FailureAlert(message: err[0].localizedDescription)
                    alert.show(animated: true)
                    self?.loader.stopAnimating()
                }
                
                if result?.data != nil {
                    if let allchannels = result?.data?.channels {
                        self?.channels = allchannels.map { ($0?.fragments.channelDetail)! }
                        self?.loader.stopAnimating()
                    }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

}

extension ChannelFilterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = channels[indexPath.row]
        filterOptions.channel = channel
        self.dismiss(animated: true) {
            self.channelDelegate?.getSelectedChannelData(options:self.filterOptions)
        }
    }
}

extension ChannelFilterController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell
        let channel = channels[indexPath.row]
        cell?.desc.text = channel.name
//        cell?.value.text = String(describing: channel.conversationCount!)
        cell?.arrow.isHidden = true
        return cell!
    }
}
