//
//  AppDelegate.swift
//  NMG.CRM
//
//  Created by soyombo bat-erdene on 4/6/18.
//  Copyright © 2018 soyombo bat-erdene. All rights reserved.
//

import UIKit
import Apollo

let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    let currentUser = ErxesUser.sharedUserInfo()
    configuration.httpAdditionalHeaders = ["x-token": currentUser.token as Any,
                                           "x-refresh-token": currentUser.refreshToken as Any]
    let url = URL(string: Constants.API_ENDPOINT +  "/graphql")!
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let loginContoller = LoginController()
        let navigationController = NavigationController(rootViewController: loginContoller)
//        UINavigationBar.appearance().barTintColor = nil
        UINavigationBar.appearance().backIndicatorImage = #imageLiteral(resourceName: "ic_back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "ic_back")
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-100, 0), for: .default)
        Route.default.setupAppNavigation(appNavigation: MyAppNavigation())
        loginContoller.title = "Login"
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

