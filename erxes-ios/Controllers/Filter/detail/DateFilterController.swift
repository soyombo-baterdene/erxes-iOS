//
//  DateFilterController.swift
//  NMG.CRM
//
//  Created by Soyombo bat-erdene on 5/25/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Daysquare

protocol DateDelegate: class  {
    func setDate(options:FilterOptions,isBeginDate:Bool)
}

class DateFilterController: UIViewController {

    weak var delegate: DateDelegate?
    var filterOptions = FilterOptions()
    var isBeginDate = false
    
    var calendarView: DAYCalendarView = {
       let calendar = DAYCalendarView(frame: CGRect(x: 0, y: 0, width: Constants.SCREEN_WIDTH-20, height: 300))
        calendar.selectedIndicatorColor = Constants.ERXES_COLOR
        calendar.weekdayHeaderWeekendTextColor = Constants.ERXES_COLOR
        calendar.tintColor = Constants.ERXES_COLOR
        calendar.addTarget(self, action: #selector(selectDate(sender:)), for: .valueChanged)
        return calendar
    }()
    
    var startDateButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Select a date", for: .normal)
        button.titleLabel?.font = Constants.LIGHT
        button.backgroundColor = Constants.ERXES_COLOR
        button.addTarget(self, action: #selector(toggleButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    var endDateButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Select a date", for: .normal)
        button.titleLabel?.font = Constants.LIGHT
        button.backgroundColor = Constants.ERXES_COLOR
        button.alpha = 0.7
        button.addTarget(self, action: #selector(toggleButton(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func toggleButton(sender:UIButton){
        if sender.alpha == 1.0 {
            return
        }
        sender.alpha = 1.0
        switch sender {
        case self.startDateButton:
            self.endDateButton.alpha = 0.7
        case self.endDateButton:
            self.startDateButton.alpha = 0.7
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
//        self.view.addSubview(startDateButton)
//        self.view.addSubview(endDateButton)
        self.view.addSubview(calendarView)
//        calendarView.center = self.view.center
      
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
////        startDateButton.snp.makeConstraints { (make) in
////            make.height.equalTo(30)
////            make.top.left.equalToSuperview()
////            make.width.equalTo(Constants.SCREEN_WIDTH/2-10)
////        }
////        endDateButton.snp.makeConstraints { (make) in
////            make.height.equalTo(30)
////            make.top.right.equalToSuperview()
////            make.width.equalTo(Constants.SCREEN_WIDTH/2-10)
////        }
//        calendarView.snp.makeConstraints { (make) in
////            make.left.width.equalToSuperview()
////            make.top.equalTo(startDateButton.snp.bottom)
//            make.edges.equalToSuperview()
//        }
////        calendarView.autoresizesSubviews = true
//        calendarView.layoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func selectDate(sender: Any){
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        let strDate = formatter.string(from: calendarView.selectedDate)
     
        if isBeginDate{
            self.filterOptions.startDate = strDate
        }else{
            self.filterOptions.endDate = strDate
        }
        print(filterOptions)
        self.dismiss(animated: true) {
            self.delegate?.setDate(options: self.filterOptions, isBeginDate: self.isBeginDate)
        }
    }
    

}
