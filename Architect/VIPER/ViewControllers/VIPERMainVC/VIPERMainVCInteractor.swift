//
//  VIPERMainVCInteractor.swift
//  Architect
//
//  Created by Александр Коробицын on 30.12.2022.
//

import Foundation

protocol VIPERMainVCInteractorInputProtocol {
    init(presenter: VIPERMainVCInteractorOutputProtocol)
    func fetchUsers()
    func fetchUser(indexPath: IndexPath)
}

protocol VIPERMainVCInteractorOutputProtocol: AnyObject {
    func sendUsers(users: VIPERFetchObjects)
    func sendUser(user: VIPERUser)
}

class VIPERMainVCInteractor: VIPERMainVCInteractorInputProtocol {
    
    unowned let presenter: VIPERMainVCInteractorOutputProtocol
    
    required init(presenter: VIPERMainVCInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchUsers() {
        VIPERNetworkManager.instance.fetchData(dataType: VIPERFetchObjects.self,
                                               url: VIPERNetworkManager.instance.api) { result in
            switch result {
                
            case .success(let users):
                self.presenter.sendUsers(users: users)
                VIPERStorageManager.instance.setUsers(users: users.users)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchUser(indexPath: IndexPath) {
        let user = VIPERStorageManager.instance.getUser(indexPath: indexPath)
        presenter.sendUser(user: user)
    }
}
