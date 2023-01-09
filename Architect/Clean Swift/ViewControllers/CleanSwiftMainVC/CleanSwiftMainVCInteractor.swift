//
//  CleanSwiftMainVCInteractor.swift
//  Architect
//
//  Created by Александр Коробицын on 09.01.2023.
//

import Foundation

protocol CleanSwiftMainVCBuisnessLogic {
    func fetchUsers()
}

protocol CleanSwiftMainVCDataStore {
    var users: [CleanSwiftUser] {get}
}


class CleanSwiftMainVCInteractor: CleanSwiftMainVCBuisnessLogic, CleanSwiftMainVCDataStore {
    var users: [CleanSwiftUser] = []
    
    func fetchUsers() {
        CleanSwiftNetworkManager.instance.fetchData(dataType: CleanSwiftFetchObjects.self,
                                                    url: CleanSwiftNetworkManager.instance.api) { result in
            switch result {
                
            case .success(let objects):
                self.users = objects.users
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
