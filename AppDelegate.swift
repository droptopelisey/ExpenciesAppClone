//
//  AppDelegate.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MainTabBar()
        window?.makeKeyAndVisible()
        
        return true
    }

}

