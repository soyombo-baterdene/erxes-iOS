//
//  ContactController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/13/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo


class ContactController: UIViewController {

    let client: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        let currentUser = ErxesUser.sharedUserInfo()
        configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
                                               "x-refresh-token": currentUser.refreshToken as Any]
        let url = URL(string:Constants.API_ENDPOINT +  "/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    let arr = ["Customers","Companies"]
    var loader: ErxesLoader = {
        let loader = ErxesLoader(frame: CGRect(x: Constants.SCREEN_WIDTH/2-25, y: Constants.SCREEN_HEIGHT/2-25, width: 50, height: 50))
        loader.lineWidth = 3
        return loader
    }()
    var isCustomer:Bool = true
    var customersLimit = 20
    var companiesLimit = 20
    var customers = [CustomerDetail]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var companies = [CompanyDetail]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var customersButton: ErxesButton = {
       let button = ErxesButton()
        button.setTitle("Customers", for: .normal)
        button.setTitle("Customers", for: .selected)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Constants.ERXES_COLOR
        button.addTarget(self, action: #selector(toggleButton(sender:)), for: .touchUpInside)
        return button
    }()

    
    var companiesButton: ErxesButton = {
        let button = ErxesButton()
        button.setTitle("Companies", for: .normal)
        button.setTitle("Companies", for: .selected)
        button.backgroundColor = Constants.INBOX_BG_COLOR
        button.setTitleColor(Constants.ERXES_COLOR, for: .normal)
        button.addTarget(self, action: #selector(toggleButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.rowHeight = 50
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        tableView.separatorColor = Constants.ERXES_COLOR
        return tableView
    }()
    
    @objc func toggleButton(sender:UIButton){
        if sender.backgroundColor == Constants.ERXES_COLOR {
            return
        }
        sender.backgroundColor = Constants.ERXES_COLOR
        sender.setTitleColor(.white, for: .normal)
        switch sender {
        case self.customersButton:
            self.companiesButton.backgroundColor = Constants.INBOX_BG_COLOR
            self.companiesButton.setTitleColor(Constants.ERXES_COLOR, for: .normal)
            self.getCustomers()
            isCustomer = true
        case self.companiesButton:
            self.customersButton.backgroundColor = Constants.INBOX_BG_COLOR
            self.customersButton.setTitleColor(Constants.ERXES_COLOR, for: .normal)
            isCustomer = false
            self.getCompanies()
        default:
            return
        }
    }
    
    func configureViews(){
        self.view.addSubview(customersButton)
        self.view.addSubview(companiesButton)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(loader)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CONTACTS"
        self.view.backgroundColor = Constants.INBOX_BG_COLOR
        self.configureViews()
//        self.getCustomers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if isCustomer{
            getCustomers()
        }else{
            getCompanies()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customersButton.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.left.equalTo(self.view.snp.left).offset(30)
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(16)
            make.right.equalTo(self.view.snp.left).offset(Constants.SCREEN_WIDTH/2-20)
        }

        companiesButton.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.left.equalTo(self.customersButton.snp.right).offset(40)
            make.top.equalTo(self.topLayoutGuide.snp.bottom).offset(16)
            make.right.equalTo(self.view.snp.right).inset(30)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).inset(16)
            make.top.equalTo(customersButton.snp.bottom).offset(10)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
        }
        
//        loader.snp.makeConstraints { (make) in
//            make.width.height.equalTo(50)
//            make.center.equalTo(self.view.snp.center)
//        }

    }
    
    func getCompanies(limit:Int = 20){
        loader.startAnimating()
        let query = CompaniesQuery()
        query.perPage = limit
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
                if let allCompanies = result?.data?.companies {
                    self?.companies = allCompanies.map { ($0?.fragments.companyDetail)! }
                self?.loader.stopAnimating()
                }
            }
        }
    }
    
    func getCustomers(limit: Int = 20) {
        loader.startAnimating()
        let query = CustomersQuery()
        query.perPage = limit
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
                if let allCustomers = result?.data?.customers {
                    self?.customers = allCustomers.map { ($0!.fragments.customerDetail) }
//                    self?.customers = allCustomers.list.map {($0.fra)}
                self?.loader.stopAnimating()
                    
                }
            }
        }
    }


}

extension ContactController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell
        if cell == nil {
            cell = ContactCell.init(style: .default, reuseIdentifier: "ContactCell")
        }
        cell?.topLabel.text = ""
        cell?.bottomLabel.text = ""
        cell?.icon.image = nil
        if isCustomer{
            let customer = customers[indexPath.row]
            cell?.icon.image = #imageLiteral(resourceName: "ic_customer").tint(with: Constants.ERXES_COLOR)
    
            if customer.firstName != nil && customer.lastName != nil{
                cell?.topLabel.text = customer.firstName! + " " + customer.lastName!
            }else if customer.firstName != nil && customer.lastName == nil{
                cell?.topLabel.text = customer.firstName
            }else if customer.firstName == nil && customer.lastName != nil {
                cell?.topLabel.text = customer.lastName
            }else{
                cell?.topLabel.text = "Unnamed"
            }
            if customer.email != nil {
                cell?.bottomLabel.text = customer.email
            }else if customer.phone != nil {
                cell?.bottomLabel.text = customer.phone
            }
            
        }else{
            cell?.icon.image = #imageLiteral(resourceName: "ic_company").tint(with: Constants.ERXES_COLOR)
            let company = companies[indexPath.row]
            if company.name != nil {
                cell?.topLabel.text = company.name
            }
            if company.website != nil {
                cell?.bottomLabel.text = company.website
            }
        }
        
        return cell!
    }
}

extension ContactController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isCustomer{
            return customers.count
        }else{
            return companies.count
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        //        self.timer.invalidate()
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= 0.0 {
            if isCustomer{
                customersLimit = customersLimit + 20
                self.getCustomers(limit: customersLimit)
            }else{
                companiesLimit = companiesLimit + 20
                self.getCompanies(limit: companiesLimit)
            }
        }
    }
}



