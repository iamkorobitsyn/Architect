//
//  MVPMainVM.swift
//  Architect
//
//  Created by Александр Коробицын on 23.11.2022.
//

import Foundation

protocol MVPMainVCPresenterProtocol {
    init(view: MVPMainVCProtocol)
    func fetchObjects(completion: @escaping() -> Void)
}

class MVPMainVCPresenter: MVPMainVCPresenterProtocol {
    
    var users: [MVPUser] = []
    unowned let view: MVPMainVCProtocol
    
    required init(view: MVPMainVCProtocol) {
        self.view = view
    }
    
    func fetchObjects(completion: @escaping () -> Void) {
        MVPNetworkManager.instance.fetchData(dataType: MVPFetchObjects.self,
                                             url: MVPNetworkManager.instance.api) {
            result in
            switch result {
                
            case .success(let objects):
                self.users = objects.users
                self.view.prepareData(numberOfRows: objects.users.count,
                                      userData: objects.users)
                
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
