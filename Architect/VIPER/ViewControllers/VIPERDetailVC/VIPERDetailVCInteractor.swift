//
//  VIPERDetailVCInteractor.swift
//  Architect
//
//  Created by Александр Коробицын on 06.01.2023.
//

import Foundation

protocol VIPERDetailVCInteractorInputProtocol {
    init(presenter: VIPERDetailVCInteractorOutputProtocol, user: VIPERUser)
    func getUser()
    func getImage()
    func setStatus()
    func getDefaultStatus()
}

protocol VIPERDetailVCInteractorOutputProtocol: AnyObject {
    func sendUser(user: VIPERUser)
    func sendUserImage(imageData: Data)
    func sendStatus(status: Bool)
    func sendDefaultStatus(status: Bool)
}

class VIPERDetalVCInteractor: VIPERDetailVCInteractorInputProtocol {
    
    var status = false
    
    func getDefaultStatus() {
        
        presenter.sendDefaultStatus(status: VIPERStorageManager.instance.getFavoriteStatus(for: "VIPER \(user.email)"))
        
        self.status = VIPERStorageManager.instance.getFavoriteStatus(for: "VIPER \(user.email)")
    }
    
    func setStatus() {
        status.toggle()
        VIPERStorageManager.instance.setFavoriteStatus(for: "VIPER \(user.email)", for: status)
        presenter.sendStatus(status: status)
    }
    
    func getImage() {
        VIPERNetworkManager.instance.fetchImage(url: user.image) { result in
            switch result {
                
            case .success(let imageData):
                self.presenter.sendUserImage(imageData: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUser() {
        presenter.sendUser(user: user)
    }

    let user: VIPERUser
    unowned let presenter: VIPERDetailVCInteractorOutputProtocol
    required init(presenter: VIPERDetailVCInteractorOutputProtocol, user: VIPERUser) {
        self.user = user
        self.presenter = presenter
    }
}

