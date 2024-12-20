//
//  TabBarViewController.swift
//  E-Commerce
//
//  Created by Mustafa Kemal ARDA on 13.12.2024.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initilazeView()
        setupTabBar()
    }

    private func initilazeView() {
        let homeVC = HomeViewController()
        let cardVC = CartViewController()
        let favoriteVC = FavoritesViewController()
        let profileVC = ProfileController()
        
        let homeNavController = UINavigationController(rootViewController: homeVC)
        let cardNavController = UINavigationController(rootViewController: cardVC)
        let favoriteNavController = UINavigationController(rootViewController: favoriteVC)
        let profileNavController = UINavigationController(rootViewController: profileVC)
        
        homeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "home"), selectedImage: UIImage(named: "home")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal))
        cardVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "cart"), selectedImage: UIImage(named: "cart")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal))
        favoriteVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "favorite"), selectedImage: UIImage(named: "favorite")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal))
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile")?.withTintColor(.systemBlue, renderingMode: .alwaysOriginal))
        
        viewControllers = [homeNavController, cardNavController, favoriteNavController, profileNavController]
    }
    
    private func setupTabBar() {
        let customTabBar = CustomTabBar()
        setValue(customTabBar, forKey: "tabBar")
        customTabBar.backgroundColor = .white
    }
}
