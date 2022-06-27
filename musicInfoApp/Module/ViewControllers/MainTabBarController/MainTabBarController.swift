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
        self.setViewControllers([makeNavigation(viewController: SearchViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass"), isLargeTitle: true, tag: 1), makeNavigation(viewController: SettingViewController(), title: "Setting", image: UIImage(systemName: "gear"), isLargeTitle: true, tag: 2)], animated: true)
        self.tabBarAppearance()
    }
    
    //MARK: - NavigationController method
    private func makeNavigation(viewController: UIViewController, title: String? , image: UIImage?, isLargeTitle: Bool, tag: Int) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.prefersLargeTitles = isLargeTitle
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
        return navigationController
    }
    
    //MARK: - TO-DO
    //MARK: - method tabBar
//    private func generateViewController(view: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        let navController = UINavigationController(rootViewController: view)
//        navController.navigationBar.prefersLargeTitles = true
//        view.title = title
//        view.tabBarItem.image = image
//        return view
//    }
//
//    private func makeTabBarController() {
//        self.viewControllers = [generateViewController(view: SearchViewController(),
//                                                       title: "Search",
//                                                       image: UIImage(systemName: "magnifyingglass")),
//                                generateViewController(view: SettingViewController(),
//                                                       title: "Setting",
//                                                       image: UIImage(systemName: "gear"))]
//    }
//
    private func tabBarAppearance() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .lightGray
    }
}
