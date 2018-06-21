//
//  TabController.swift
//  Erxes.io
//
//  Created by soyombo bat-erdene on 2/20/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit


class TabController: UITabBarController {


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.barTintColor = Constants.INBOX_BG_COLOR
        UITabBar.appearance().barTintColor = Constants.INBOX_BG_COLOR
        // Do any additional setup after loading the view.
        setupTabs()
    }
    
    func setupTabs(){
        
//        
        let inboxVC = InboxController()
        let contactVC = ContactController()
        tabBar.itemPositioning = .fill
        self.tabBar.itemSpacing = 0
        self.tabBar.itemWidth = self.view.bounds.size.width/3
        self.tabBar.barTintColor = .clear
        self.tabBar.backgroundImage = UIImage.colorForNavBar(color: Constants.INBOX_BG_COLOR)
        UITabBar.appearance().tintColor = Constants.ERXES_COLOR
        UITabBar.appearance().unselectedItemTintColor = Constants.ERXES_COLOR.withAlphaComponent(0.6)
        self.tabBar.backgroundColor = Constants.INBOX_BG_COLOR
        inboxVC.tabBarItem = UITabBarItem.init(title: "INBOX", image: #imageLiteral(resourceName: "ic_inbox"), selectedImage: #imageLiteral(resourceName: "ic_inbox"))
        contactVC.tabBarItem = UITabBarItem.init(title: "CONTACTS", image: #imageLiteral(resourceName: "ic_contact"), selectedImage: #imageLiteral(resourceName: "ic_contact"))
        self.tabBarController?.viewControllers = [inboxVC,contactVC]
        let nav1 = NavigationController.init(rootViewController:inboxVC)
        let nav2 = NavigationController.init(rootViewController: contactVC)
        self.viewControllers = [nav1,nav2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}

extension UIImage {
    class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect(x:0.0, y:0.0, width:1.0, height:1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
