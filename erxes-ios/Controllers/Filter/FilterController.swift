//
//  FilterController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 6/11/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import SnapKit
protocol FilterDelegate: class  {
    func passFilterOptions(options:FilterOptions)
}
class FilterController: UIViewController {
    
    weak var delegate: FilterDelegate?
    
    var filterOptions = FilterOptions()
    let sections = ["# Channel","Date","Status","Brand","Integration","Tag"]
    
    var channels = [ChannelDetail](){
        didSet {
            tableView.reloadData()
        }
    }
    
    var brands = [BrandDetail](){
        didSet{
            tableView.reloadData()
        }
    }
    
    var tags = [TagDetail]() {
        didSet{
            tableView.reloadData()
        }
    }
    let dates = ["Begin date:","End date:"]
    let integrations = ["messenger","twitter","facebook","form"]
    let statusArray = ["Unassigned","Participating","Resolved"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FILTERS"
        configureViews()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func configureViews() {
      
        let leftButton = UIButton()
        leftButton.setTitle("Clear", for: .normal)
//        leftImage = leftImage.withRenderingMode(.alwaysTemplate)
        let leftItem = UIBarButtonItem()
        leftItem.tintColor = Constants.ERXES_COLOR
        leftButton.setTitleColor(Constants.ERXES_COLOR, for: .normal)
        leftButton.addTarget(self, action: #selector(clear(sender:)), for: .touchUpInside)
        leftItem.customView = leftButton
        self.navigationItem.leftBarButtonItem = leftItem
        

        let rightButton = UIButton()
        rightButton.setTitle("Done", for: .normal)
        rightButton.setTitleColor(Constants.ERXES_COLOR, for: .normal)
        rightButton.addTarget(self, action: #selector(close(sender:)), for: .touchUpInside)
        let rightItem = UIBarButtonItem()
        rightItem.tintColor = Constants.ERXES_COLOR
        rightItem.customView = rightButton
        self.navigationItem.rightBarButtonItem = rightItem

        self.view.backgroundColor = Constants.INBOX_BG_COLOR
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @objc func clear(sender:UIButton){
        tableView.reloadData()
        self.filterOptions.removeAll()
        tableView.layoutSubviews()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    @objc func close(sender:UIButton){
 
        self.dismiss(animated: true) {
            self.delegate?.passFilterOptions(options: self.filterOptions)
        }
    }
    
    var tableView:UITableView = {
       let tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.register(FilterCell.self, forCellReuseIdentifier: "FilterCell")
        tableview.register(CheckBoxCell.self, forCellReuseIdentifier: "CheckBoxCell")
        tableview.sectionHeaderHeight = 40
        tableview.tableFooterView = UIView()
        
        return tableview
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
        }
    }
    
    func presentViewControllerAsPopover(viewController: UIViewController, from: UIView) {
        if let presentedVC = self.presentedViewController {
            if presentedVC.nibName == viewController.nibName {
                // The view is already being presented
                return
            }
        }
        // Specify presentation style first (makes the popoverPresentationController property available)
        viewController.modalPresentationStyle = .popover
        let viewPresentationController = viewController.popoverPresentationController
        if let presentationController = viewPresentationController {
            presentationController.delegate = self
            presentationController.permittedArrowDirections = [.down,.up]
            presentationController.sourceView = from
            presentationController.sourceRect = from.bounds
        }
        viewController.preferredContentSize = CGSize(width: Constants.SCREEN_WIDTH, height: 300)
        
        self.present(viewController, animated: true, completion: nil)
    }
    
}

extension FilterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0{
            let currentCell = tableView.cellForRow(at: indexPath) as! FilterCell
            let controller = ChannelFilterController()
            controller.channelDelegate = self
            self.presentViewControllerAsPopover(viewController: controller, from: currentCell.arrow)
        }else if indexPath.section == 3 {
            let currentCell = tableView.cellForRow(at: indexPath) as! FilterCell
            let controller = BrandFilterController()
            controller.delegate = self
            self.presentViewControllerAsPopover(viewController: controller, from: currentCell.arrow)
        }else if indexPath.section == 5{
            let currentCell = tableView.cellForRow(at: indexPath) as! FilterCell
            let controller = TagFilterController()
            controller.delegate = self
            self.presentViewControllerAsPopover(viewController: controller, from: currentCell.arrow)
        }else if indexPath.section == 2{
            let indexArray = [0,1,2]
            for i in indexArray {
                let cell = tableView.cellForRow(at: IndexPath(row: i, section: 2)) as! CheckBoxCell
                if i != indexPath.row {
                    cell.checkButton.isOn = false
                   
                }else{
                    if cell.checkButton.isOn {
                        cell.checkButton.isOn = false
                        self.filterOptions.unassigned = ""
                        self.filterOptions.participating = ""
                        self.filterOptions.status = ""
                    }else{
                        cell.checkButton.isOn = true
                        switch indexPath.row {
                        case 0:
                            self.filterOptions.unassigned = "true"
                            self.filterOptions.participating = ""
                            self.filterOptions.status = ""
                        case 1:
                            self.filterOptions.unassigned = ""
                            self.filterOptions.participating = "true"
                            self.filterOptions.status = ""
                        case 2:
                           self.filterOptions.status = "closed"
                           self.filterOptions.unassigned = ""
                           self.filterOptions.participating = ""
                        default:
                            self.filterOptions.unassigned = ""
                            self.filterOptions.participating = ""
                            self.filterOptions.status = ""
                        }
                     
                    }
                }
            }
        }else if indexPath.section == 4 {
            let indexArray = [0,1,2,3]
            for i in indexArray {
                let cell = tableView.cellForRow(at: IndexPath(row: i, section: 4)) as! CheckBoxCell
                if i != indexPath.row {
                    cell.checkButton.isOn = false
                    
                }else{
                    if cell.checkButton.isOn {
                        cell.checkButton.isOn = false
                        self.filterOptions.integrationType = ""
                    }else{
                        cell.checkButton.isOn = true
                        self.filterOptions.integrationType = integrations[i]
                    }
                }
            }
        }else if indexPath.section == 1 {
            let currentCell = tableView.cellForRow(at: indexPath) as! FilterCell
            let controller = DateFilterController()
            controller.delegate = self
            if indexPath.row == 0 {
                controller.isBeginDate = true
            }else{
                controller.isBeginDate = false
            }
            self.presentViewControllerAsPopover(viewController: controller, from: currentCell.arrow)
        }
    }
}

extension FilterController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
 
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 10, y: 0, width: tableView.frame.size.width-20, height: 40))
        headerView.backgroundColor = Constants.INBOX_BG_COLOR
        let titleLabel = UILabel()
        titleLabel.frame = headerView.frame
        
        titleLabel.textColor = Constants.ERXES_COLOR
        titleLabel.font = Constants.LIGHT
//        titleLabel.text = "asd"
        headerView.addSubview(titleLabel)
        titleLabel.text = self.sections[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return dates.count
        case 2:
            return statusArray.count
        case 3:
            return 1
        case 4:
            return integrations.count
        case 5:
            return 1
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        switch indexPath.section {
        case 0:
           let cell = (tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell)!
           cell.contentView.backgroundColor = .clear
           cell.value.text = ""
           cell.desc.text = "Channel:"
           cell.tintColor = Constants.ERXES_COLOR
          
            return cell
        case 1:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell)!
            cell.contentView.backgroundColor = .clear
            cell.value.text = ""
            cell.desc.text = dates[indexPath.row]
            return cell
        case 2:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath) as? CheckBoxCell)!
            cell.contentView.backgroundColor = .clear
            cell.checkButton.isOn = false
            cell.desc.text = statusArray[indexPath.row]
            return cell
        case 3:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell)!
            cell.contentView.backgroundColor = .clear
            cell.value.text = ""
            cell.desc.text = "Brand:"
            cell.tintColor = Constants.ERXES_COLOR
            return cell
        case 4:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "CheckBoxCell", for: indexPath) as? CheckBoxCell)!
            cell.contentView.backgroundColor = .clear
            cell.checkButton.isOn = false
            cell.desc.text = integrations[indexPath.row]
            return cell
        case 5:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell)!
            cell.contentView.backgroundColor = .clear
            cell.value.text = ""
            cell.desc.text = "Tag:"
            cell.tintColor = Constants.ERXES_COLOR
            return cell
        default:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as? FilterCell)!
            return cell
        }
        
       
    }
}

extension FilterController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

extension FilterController: ChannelDelegate {
    func getSelectedChannelData(options: FilterOptions) {
        self.filterOptions.channel = options.channel
        let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! FilterCell
        cell.value.text = self.filterOptions.channel?.name
    
    }
}

extension FilterController: BrandDelegate {
    func getSelectedData(options: FilterOptions) {
        self.filterOptions.brand = options.brand
        let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 3)) as! FilterCell
        cell.value.text = self.filterOptions.brand?.name
        
    }
}

extension FilterController: TagDelegate {
    func setTag(options: FilterOptions) {
        self.filterOptions.tag = options.tag
        let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 5)) as! FilterCell
        cell.value.text = self.filterOptions.tag?.name
    }
}

extension FilterController: DateDelegate {
    func setDate(options: FilterOptions, isBeginDate: Bool) {
        
        
        if isBeginDate{
            self.filterOptions.startDate = options.startDate
            let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! FilterCell
            cell.value.text = self.filterOptions.startDate
        }else{
            self.filterOptions.endDate = options.endDate
            let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 1)) as! FilterCell
            cell.value.text = self.filterOptions.endDate
        }
    }
}
