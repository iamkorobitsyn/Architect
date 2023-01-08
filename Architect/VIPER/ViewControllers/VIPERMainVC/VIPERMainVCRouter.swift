//
//  VIPERMainVCRouter.swift
//  Architect
//
//  Created by Александр Коробицын on 02.01.2023.
//

import Foundation

protocol VIPERMainVCRouterInputProtocol {
    init(viewController: VIPERMainVC)
    func transition(user: VIPERUser)
}

class VIPERMainVCRouter: VIPERMainVCRouterInputProtocol {
    
    unowned let viewController: VIPERMainVC
    required init(viewController: VIPERMainVC) {
        self.viewController = viewController
    }
    
    func transition(user: VIPERUser) {
        let transitionVC = VIPERDetailVC()
        viewController.navigationController?.pushViewController(transitionVC, animated: true)
        let configurator: VIPERDetailVCConfiguratorInputProtocol = VIPERDetailVCConfigurator()
        configurator.configure(viewController: transitionVC, user: user)
    }
}
