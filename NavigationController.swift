//
//  NavigationController.swift
//  NMG.CRM
//
//  Created by soyombo bat-erdene on 4/6/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: Constants.BOLD!]
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: Constants.ERXES_COLOR]
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationBar.barTintColor = Constants.INBOX_BG_COLOR
        self.navigationBar.barTintColor = .white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}
