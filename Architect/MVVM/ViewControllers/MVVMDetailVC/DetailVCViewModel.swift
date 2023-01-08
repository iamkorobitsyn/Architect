//
//  DetailVCViewModel.swift
//  Architect
//
//  Created by Александр Коробицын on 05.12.2022.
//

import Foundation

protocol MVVMDetailViewModelProtocol {
    init(user: MVVMUser)
    func fetchImage(completion: @escaping(Data) -> Void)
    
    var nameSurename: String {get}
    var age: String {get}
    var gender: String {get}
    var email: String {get}
    
    var favorite: Box<Bool> {get}
    func changeFavoriteValue()
}

class MVVMDetailViewModel: MVVMDetailViewModelProtocol {
    
    private let user: MVVMUser
    required init(user: MVVMUser) {
        self.user = user
        self.favorite = Box(
            value: MVVMStorageManager.instance.getFavoriteStatus(for: "MVVM\(user.email)"))
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
    var age: String {
        "\(user.age)"
    }
    var gender: String {
        user.gender
    }
    var email: String {
        user.email
    }
    
    var favorite: Box<Bool>
    
    func changeFavoriteValue() {
        favorite.value.toggle()
        MVVMStorageManager.instance.setFavoriteStatus(for: "MVVM\(user.email)",
                                                      for: favorite.value)
    }
}
