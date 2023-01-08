//
//  VIPERDetailVCConfigurator.swift
//  Architect
//
//  Created by Александр Коробицын on 06.01.2023.
//

import Foundation

protocol VIPERDetailVCConfiguratorInputProtocol {
    func configure(viewController: VIPERDetailVC, user: VIPERUser)
}

class VIPERDetailVCConfigurator: VIPERDetailVCConfiguratorInputProtocol {
    func configure(viewController: VIPERDetailVC, user: VIPERUser) {
        let presenter = VIPERDetailVCPresenter(view: viewController)
        let interactor = VIPERDetalVCInteractor(presenter: presenter, user: user)
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}
