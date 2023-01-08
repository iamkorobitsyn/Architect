//
//  VIPERMainVCConfigurator.swift
//  Architect
//
//  Created by Александр Коробицын on 30.12.2022.
//

import Foundation

protocol VIPERMainVCConfiguratorInputProtocol {
    func configure(viewController: VIPERMainVC)
}

class VIPERMainVCConfigurator: VIPERMainVCConfiguratorInputProtocol {
    
    
    func configure(viewController: VIPERMainVC) {
        let presenter = VIPERMainVCPresenter(view: viewController)
        let interactor = VIPERMainVCInteractor(presenter: presenter)
        let router = VIPERMainVCRouter(viewController: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
