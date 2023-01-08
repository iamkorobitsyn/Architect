//
//  TabBarController.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

class TabBarController: UITabBarController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instanceTabBarColors()
        instanceViewControllers()
    }
    
    private func instanceTabBarColors() {
        tabBar.backgroundColor = UIColor.lightGray
        tabBar.tintColor = UIColor.white
        tabBar.barTintColor = UIColor.lightGray
        tabBar.unselectedItemTintColor = UIColor.darkGray
    }
    
    private func instanceViewControllers() {
        let icon = UIImage(systemName: "swift")
        viewControllers = [instanceNavController(rootViewController: MVPMainVC(),
                                                 title: "MVP",
                                                 image: icon ?? .add),
                           instanceNavController(rootViewController: MVVMMainVC(),
                                                 title: "MVVM",
                                                 image: icon ?? .add),
                           instanceNavController(rootViewController: VIPERMainVC(),
                                                 title: "VIPER",
                                                 image: icon ?? .add),
                           instanceNavController(rootViewController: CleanSwiftMainVC(),
                                                 title: "Clean Swift",
                                                 image: icon ?? .actions)]
    }
    
    private func instanceNavController(rootViewController: UIViewController,
                                       title: String,
                                       image: UIImage) -> UIViewController {
        let nav = UINavigationController(rootViewController: rootViewController)
        rootViewController.title = title
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.navigationBar.prefersLargeTitles = true

        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = UIColor.lightGray
        appearence.largeTitleTextAttributes = [.backgroundColor: UIColor.lightGray,
                                               .foregroundColor: UIColor.red.withAlphaComponent(0.7)]
        appearence.titleTextAttributes = [.backgroundColor: UIColor.lightGray,
                                          .foregroundColor: UIColor.red.withAlphaComponent(0.7)]
        nav.navigationBar.standardAppearance = appearence
        nav.navigationBar.scrollEdgeAppearance = appearence
        nav.navigationBar.tintColor = UIColor.red
        
        return nav
    }
}
