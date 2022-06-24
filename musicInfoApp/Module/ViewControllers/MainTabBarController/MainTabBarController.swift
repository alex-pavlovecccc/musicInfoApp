//
//  MainTabBarController.swift
//  musicInfoApp
//
//  Created by Alexander Pavlovets on 24.06.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeTabBarController()
        self.tabBarAppearance()
    }
    
    
    //MARK: - method 
    private func generateViewController(view: UIViewController, title: String, image: UIImage?) -> UIViewController {
        view.title = title
        view.tabBarItem.image = image
        return view
    }
    
    private func makeTabBarController() {
        self.viewControllers = [generateViewController(view: SearchViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass"))]
    }
    
    private func tabBarAppearance() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .systemPink
    }
}
