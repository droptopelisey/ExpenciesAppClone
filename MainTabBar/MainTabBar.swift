//
//  MainTabBar.swift
//  mvvm-demo2
//
//  Created by Eliseev Anton on 04.12.2023.
//

import UIKit

class MainTabBar: UITabBarController {
    
    
// MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupBars()
    }
    
    // MARK: Setups
    
    private func setupBars() {
        viewControllers = [
        firstTabBarItem(),
        secondTabBarItem(),
        thirdTabBarItem()
        ]
    }
    
    private func firstTabBarItem() -> UINavigationController {
        let vc = DashboardViewController(viewModel: DashboardViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(systemName: "creditcard.fill"), tag: 0)
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
    private func secondTabBarItem() -> UINavigationController {
        let vc = HistoryViewController(viewModel: HistoryViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "list.bullet"), tag: 0)
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
    private func thirdTabBarItem() -> UINavigationController {
        let vc = SettingsViewController(viewModel: SettingsViewModel())
        let nc = UINavigationController(rootViewController: vc)
        nc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 0)
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }
    
}
