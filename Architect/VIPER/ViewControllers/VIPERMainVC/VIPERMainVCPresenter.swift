//
//  VIPERMainVCPresenter.swift
//  Architect
//
//  Created by Александр Коробицын on 30.12.2022.
//

import Foundation

class VIPERMainVCPresenter: VIPERMainVCOutputProtocol {
    
    var interactor: VIPERMainVCInteractorInputProtocol?
    var router: VIPERMainVCRouter?
    unowned let view: VIPERMainVCInputProtocol
    required init(view: VIPERMainVCInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor?.fetchUsers()
    }
    
    func didTapCell(indexPath: IndexPath) {
        interactor?.fetchUser(indexPath: indexPath)
    }
}


extension VIPERMainVCPresenter: VIPERMainVCInteractorOutputProtocol {
    func sendUser(user: VIPERUser) {
        router?.transition(user: user)
    }
    
    func sendUsers(users: VIPERFetchObjects) {
        
        var section: VIPERMainSectionRepresentable = VIPERMainSectionViewModel()
        
        users.users.forEach { user in
            let viewModel = VIPERMainCellViewModel(user: user)
            section.rows.append(viewModel)
            view.update(section: section)
        }
    }
    
    
}
