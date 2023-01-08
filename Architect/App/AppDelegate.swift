//
//  AppDelegate.swift
//  Architect
//
//  Created by Александр Коробицын on 18.11.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = TabBarController()
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        return true
    }
}

