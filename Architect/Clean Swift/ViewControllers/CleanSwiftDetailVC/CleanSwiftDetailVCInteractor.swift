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
    
    var user: CleanSwiftUser?
    var presenter: CleanSwiftDetailVCPresenter?
    
    func getUser() {
        guard let user = user else {return}
        let respounce = DetailVC.ShowDetails.Respounse(name: user.firstName,
                                       Surename: user.lastName,
                                       age: user.age,
                                       gender: user.gender,
                                       mail: user.email)
        presenter?.presentUser(respounce: respounce) 
    }
}
