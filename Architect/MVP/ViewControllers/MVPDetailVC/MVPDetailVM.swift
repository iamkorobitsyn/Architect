//
//  MVPDetailVM.swift
//  Architect
//
//  Created by Александр Коробицын on 23.11.2022.
//

import Foundation

protocol MVPDetailPresenterProtocol {
    init(user: MVPUser, view: MVPDetailProtocol)
    func prepareData()
    func fetchImage()
    
    func toggleFavoriteStatus()
}

class MVPDetailPresenter: MVPDetailPresenterProtocol {
    
    let user: MVPUser
    
    var favorite: Bool {
        get {
            MVPStorageManager.instance.getFavoriteStatus(for: "MVP\(user.email)")
        } set {
            MVPStorageManager.instance.setFavoriteStatus(for: "MVP\(user.email)",
                                                         for: newValue)
        }
    }
    
    unowned let view: MVPDetailProtocol
    
    required init(user: MVPUser, view: MVPDetailProtocol) {
        self.user = user
        self.view = view
    }
    
    func prepareData() {
        view.setFavoriteStatus(bool: favorite)
        view.prepareData(nameSurename:
        "\(user.firstName) \(user.lastName)",
        age: "\(user.age)",
        gender: user.gender,
        email: user.email)
    }
    
    func fetchImage() {
        MVPNetworkManager.instance.fetchImage(url: user.image) { result in
            
            switch result {
            case .success(let imageData):
                self.view.fetchImage(imageData: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func toggleFavoriteStatus() {
        favorite.toggle()
        view.setFavoriteStatus(bool: favorite)
    }
}

