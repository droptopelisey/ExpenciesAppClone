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

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        loadWindow()
        checkFirstTime()
        return true
    }

    func loadWindow() {
        window = UIWindow()
        window?.rootViewController = MainTabBar()
        window?.makeKeyAndVisible()
    }
    
    func checkFirstTime() {
        if SettingsManager.shared.isFirstTimeHere {
            CategoriesStore.shared.setupDefaultCategories()
            SettingsManager.shared.isFirstTimeHere = false
        }
    }
}

