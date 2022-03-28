//
//  AppDelegate.swift
//  GeetaShopping
//
//  Created by Kholmumin Tursinboev on 19/01/22.
//

import UIKit
import SideMenuSwift
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        window = UIWindow()
        let nc = UINavigationController(rootViewController: HomeViewController(nibName: "HomeViewController", bundle: nil))
        window?.rootViewController = SideMenuController(contentViewController: nc,
                                                        menuViewController: ProfileViewController(nibName: "ProfileViewController", bundle: nil))
        window?.makeKeyAndVisible()

        editNavigation()
       UINavigationBar.appearance().tintColor = UIColor.black

        return true
    }

    func editNavigation(){
//        UINavigationBar.appearance().tintColor = UIColor.white
    }
}


