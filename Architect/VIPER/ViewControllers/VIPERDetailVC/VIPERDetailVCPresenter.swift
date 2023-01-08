//
//  VIPERDetailVCPresenter.swift
//  Architect
//
//  Created by Александр Коробицын on 06.01.2023.
//

import Foundation

class VIPERDetailVCPresenter: VIPERDetailVCOutputProtocol {
    
    unowned let view: VIPERDetailVCInputProtocol
    var interactor: VIPERDetailVCInteractorInputProtocol?
    
    required init(view: VIPERDetailVCInputProtocol) {
        self.view = view
    }
    
    func updateDescriptions() {
        interactor?.getUser()
        interactor?.getImage()
        interactor?.getDefaultStatus()
    }
    
    func togleFavorite() {
        interactor?.setStatus()
    }
}

extension VIPERDetailVCPresenter: VIPERDetailVCInteractorOutputProtocol {
    func sendDefaultStatus(status: Bool) {
        view.displayLikeButton(status: status)
    }
    
    func sendStatus(status: Bool) {
        view.displayLikeButton(status: status)
    }
    
    func sendUserImage(imageData: Data) {
        view.displayPhoto(imageData: imageData)
    }
    
    func sendUser(user: VIPERUser) {
        view.displayUserDescriptions(nameSurename: "\(user.firstName) \(user.lastName)",
                                     age: String(user.age),
                                     gender: user.gender,
                                     mail: user.email)
    }
    
    
}
