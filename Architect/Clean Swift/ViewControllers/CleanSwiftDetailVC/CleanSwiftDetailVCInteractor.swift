//
//  CleanSwiftDetailVCInteractor.swift
//  Architect
//
//  Created by Александр Коробицын on 14.01.2023.
//

import Foundation
protocol CleanSwiftDetailVCDataStore {
    var user: CleanSwiftUser? { get set }
}

class CleanSwiftDetailVCInteractor: CleanSwiftDetailVCDataStore {
    
    var favoriteStatus = false
    var user: CleanSwiftUser?
    var presenter: CleanSwiftDetailVCPresenter?

    func getUser() {
        guard let user = user else {return}
        let respounce = DetailVC.ShowDetails.Respounse(name: user.firstName,
                                       Surename: user.lastName,
                                       age: user.age,
                                       gender: user.gender,
                                       mail: user.email,
                                       image: user.image)
        presenter?.presentUser(respounce: respounce)
    }
    
    func getFavoriteStatus() {
        guard let user = user else {return}
        self.favoriteStatus = CleanSwiftStorageManager.instance.getFavoriteStatus(for: "CleanSwift \(user.email)")
        
        let respounce = DetailVC.SetStatus.Status(status: favoriteStatus)
        presenter?.presentStatus(respounce: respounce)
    }
    
    func setFavoriteStatus() {
        guard let user = user else {return}
        favoriteStatus.toggle()
        CleanSwiftStorageManager.instance.setFavoriteStatus(for: "CleanSwift \(user.email)", for: favoriteStatus)
        let respounce = DetailVC.SetStatus.Status(status: favoriteStatus)
        presenter?.presentStatus(respounce: respounce)
    }
}
