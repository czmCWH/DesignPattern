//
//  AppDelegate.swift
//  DesignPattern
//
//  Created by czm on 2021/10/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        let naviVC = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = naviVC
        window?.makeKeyAndVisible()
        
        
        return true
    }

}

