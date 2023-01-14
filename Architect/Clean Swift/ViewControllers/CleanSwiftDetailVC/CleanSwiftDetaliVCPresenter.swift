//
//  CleanSwiftDetaliPresenter.swift
//  Architect
//
//  Created by Александр Коробицын on 14.01.2023.
//

import Foundation

protocol CleanSwiftDetailVCPresentationLogic {
    func presentUser(respounce: DetailVC.ShowDetails.Respounse)
}

class CleanSwiftDetailVCPresenter: CleanSwiftDetailVCPresentationLogic {
    
    weak var viewController: CleanSwiftDetailVC?
    
    func presentUser(respounce: DetailVC.ShowDetails.Respounse) {
        let viewModel = DetailVC.ShowDetails.ViewModel(nameSurename:
                                                        "\(respounce.name) \(respounce.Surename)",
                                                       age: String(respounce.age),
                                                       gender: respounce.gender,
                                                       mail: respounce.mail)
        viewController?.displayDetailVC(display: viewModel)
    }

}
