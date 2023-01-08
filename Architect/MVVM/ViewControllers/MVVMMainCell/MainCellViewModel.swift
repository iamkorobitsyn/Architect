//
//  MainCellViewModel.swift
//  Architect
//
//  Created by Александр Коробицын on 05.12.2022.
//

import Foundation

protocol MVVMMainCellViewModelProtocol {
    
    init(user: MVVMUser)
    func fetchImage(completion: @escaping(Data) -> Void)
    var nameSurename: String {get}
}

class MVVMMainCellViewModel: MVVMMainCellViewModelProtocol {
    
    private let user: MVVMUser
    required init(user: MVVMUser) {
        self.user = user
    }
    
    func fetchImage(completion: @escaping (Data) -> Void) {
        MVVMNetworkManager.instance.fetchImage(url: user.image) { result in
            switch result {
            case .success(let imageData):
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    var nameSurename: String {
        "\(user.firstName) \(user.lastName)"
    }
}
