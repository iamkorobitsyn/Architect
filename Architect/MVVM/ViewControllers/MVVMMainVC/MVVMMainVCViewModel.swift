//
//  MVVMMainVCViewModel.swift
//  Architect
//
//  Created by Александр Коробицын on 05.12.2022.
//

import Foundation

protocol MVVMMainVCViewModelProtocol {
    var objects: [MVVMUser] {get}
    func fetchObjects(completion: @escaping() -> Void)
    var numberOfRows: Int {get}
    
    func instanceCellViewModel(indexPath: IndexPath) -> MVVMMainCellViewModelProtocol
    func instanceDetailViewModel(indexPath: IndexPath) -> MVVMDetailViewModelProtocol
}

class MVVMMainVCViewModel: MVVMMainVCViewModelProtocol {
    
    var objects: [MVVMUser] = []
    
    func fetchObjects(completion: @escaping () -> Void) {
        MVVMNetworkManager.instance.fetchData(dataType: MVVMFetchObjects.self,
                                              url: MVVMNetworkManager.instance.api)
        { result in
            switch result {
            case .success(let objectsData):
                self.objects = objectsData.users
                self.numberOfRows = objectsData.users.count
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var numberOfRows: Int = 0
    
    func instanceCellViewModel(indexPath: IndexPath) -> MVVMMainCellViewModelProtocol {
        let user = objects[indexPath.row]
        return MVVMMainCellViewModel(user: user)
    }
    
    func instanceDetailViewModel(indexPath: IndexPath) -> MVVMDetailViewModelProtocol {
        let user = objects[indexPath.row]
        return MVVMDetailViewModel(user: user)
    }
}
