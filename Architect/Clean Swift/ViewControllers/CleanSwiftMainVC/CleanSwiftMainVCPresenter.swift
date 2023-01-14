//
//  CleanSwiftMainVCPresenter.swift
//  Architect
//
//  Created by Александр Коробицын on 10.01.2023.
//

import Foundation

protocol CleanSwiftMainVCPresentationLogic {
    func presentUsers(respounce: MainVC.ShowUsers.Respounce)
}

class CleanSwiftMainVCPresenter: CleanSwiftMainVCPresentationLogic {
    
    weak var viewController: CleanSwiftMainVCDisplayLogic?
    
    func presentUsers(respounce: MainVC.ShowUsers.Respounce) {
        var rows: [MainVC.ShowUsers.ViewModel.CellViewModel] = []
        respounce.users.forEach { user in
            rows.append(MainVC.ShowUsers.ViewModel.CellViewModel(user: user))
        }
        let viewModel = MainVC.ShowUsers.ViewModel(rows: rows)
        viewController?.displayMainVC(display: viewModel)
    }
}
