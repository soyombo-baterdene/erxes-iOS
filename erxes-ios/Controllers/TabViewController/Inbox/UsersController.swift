//
//  UsersController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/19/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo
import SDWebImage

protocol UserControllerDelegate: class  {
    func assignUser(userId:String, conversationId:String)
}
class UsersController: UIViewController {

    let client: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let currentUser = ErxesUser.sharedUserInfo()
        configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
                                               "x-refresh-token": currentUser.refreshToken as Any]
        let url = URL(string: Constants.API_ENDPOINT + "/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    var conversationId = String()
    var loader: ErxesLoader = {
        let loader = ErxesLoader(frame: CGRect(x: Constants.SCREEN_WIDTH/2-35, y: 125, width: 50, height: 50))
        loader.lineWidth = 3
        return loader
    }()
    weak var delegate: UserControllerDelegate?
    
    var users = [UserData]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
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
//        loader.backgroundColor = .red
        self.view.addSubview(loader)
        self.view.backgroundColor = .clear
        // Do any additional setup after loading the view.
        self.getUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUsers(){
        loader.startAnimating()
        let query = GetUsersQuery()
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
                if let result = result?.data?.users {
                    self?.users = result.map { ($0?.fragments.userData)! }
                    self?.loader.stopAnimating()
                }
            }
        }
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
//        loader.snp.makeConstraints { (make) in
//            
//            make.width.height.equalTo(50)
//            make.centerX.equalTo((Constants.SCREEN_WIDTH-20)/2)
//            make.centerY.equalTo(150)
//        }

    }
    
}

extension UsersController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        self.dismiss(animated: true) {
           self.delegate?.assignUser(userId: user.id,conversationId: self.conversationId)
        }
    }
}

extension UsersController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        let user = users[indexPath.row]
        cell?.fullName.text = ""
        cell?.avatar.image = nil
        cell?.fullName.text = user.details?.fullName
        cell?.avatar.sd_setImage(with: URL(string: (user.details?.avatar)!), placeholderImage: UIImage(named: "avatar.png"))
        return cell!
    }
}
