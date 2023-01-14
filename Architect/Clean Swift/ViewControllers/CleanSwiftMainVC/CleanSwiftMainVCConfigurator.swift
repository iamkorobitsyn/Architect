//
//  CleanSwiftMainVCConfigurator.swift
//  Architect
//
//  Created by Александр Коробицын on 10.01.2023.
//

import Foundation

final class CleanSwiftMainVCConfigurator {
    
    static let instance = CleanSwiftMainVCConfigurator()
    private init() {}
    
    func configure(viewController: CleanSwiftMainVC) {
        let viewController = viewController
        let interactor = CleanSwiftMainVCInteractor()
        let presenter = CleanSwiftMainVCPresenter()
        let router = CleanSwiftMainVCRouter()
        viewController.interactor = interactor
        viewController.router = router
        router.viewController = viewController
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}
