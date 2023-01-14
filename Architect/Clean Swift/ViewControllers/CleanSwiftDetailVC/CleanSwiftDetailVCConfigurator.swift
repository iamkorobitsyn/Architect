//
//  CleanSwiftDetailConfigurator.swift
//  Architect
//
//  Created by Александр Коробицын on 14.01.2023.
//

import Foundation

final class CleanSwiftDetailVCConfigurator {
    
    static let instance = CleanSwiftDetailVCConfigurator()
    private init() {}
    
    func configure(viewController: CleanSwiftDetailVC) {
        let interactor = CleanSwiftDetailVCInteractor()
        let presenter = CleanSwiftDetailVCPresenter()
        let router = CleanSwiftDetalVCRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        router.dataStore = interactor
        presenter.viewController = viewController
    }
}
