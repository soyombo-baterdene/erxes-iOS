//
//  BrandFilterController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 5/15/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo
import SnapKit


protocol BrandDelegate: class  {
    func getSelectedData(options:FilterOptions)
}

class BrandFilterController: UIViewController {

    let client: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let currentUser = ErxesUser.sharedUserInfo()
        configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
                                               "x-refresh-token": currentUser.refreshToken as Any]
        let url = URL(string: Constants.API_ENDPOINT + "/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    weak var delegate: BrandDelegate?
    
    var filterOptions = FilterOptions()
    
    var loader: ErxesLoader = {
        let loader = ErxesLoader(frame: CGRect(x: Constants.SCREEN_WIDTH/2-35, y: 125, width: 50, height: 50))
        loader.lineWidth = 3
        return loader
    }()
    
    var brands = [BrandDetail](){
        didSet{
            tableView.reloadData()
        }
    }
    
    
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
        getBrands()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getBrands(){
        loader.startAnimating()
        let query = BrandsQuery()
        client.fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { [weak self] result, error in
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
                if let allBrands = result?.data?.brands {
                    self?.brands = allBrands.map { ($0?.fragments.brandDetail)! }
                   
                    self?.loader.stopAnimating()
                    
                }
                
            }
        }
    }

}

extension BrandFilterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let brand = brands[indexPath.row]
        filterOptions.brand = brand
        self.dismiss(animated: true) {
            self.delegate?.getSelectedData(options: self.filterOptions)
        }
    }
}

extension BrandFilterController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell
        let brand = brands[indexPath.row]
        cell?.desc.text = brand.name
//        cell?.value.text = "(" + String(describing: brand.!) + ")"
//        cell?.value.text = "0"
        cell?.arrow.isHidden = true
        return cell!
    }
}
