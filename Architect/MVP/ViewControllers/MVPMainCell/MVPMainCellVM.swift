//
//  MVPMainCellVM.swift
//  Architect
//
//  Created by Александр Коробицын on 23.11.2022.
//

import Foundation

protocol MVPMainCellPresenterProtocol {
    init(user: MVPUser, view: MVPMainCellProtocol)
    func fetchImage()
    func prepareData()
}

class MVPMainCellPresenter: MVPMainCellPresenterProtocol {

    let user: MVPUser
    unowned let view: MVPMainCellProtocol
    
    required init(user: MVPUser, view: MVPMainCellProtocol) {
        self.user = user
        self.view = view
    }
    
    func prepareData() {
        self.view.prepareData(nameSurename:
                              "\(self.user.firstName) \(self.user.lastName)")
    }
    
    func fetchImage() {
        MVPNetworkManager.instance.fetchImage(url: user.image) { result in
            switch result {
                
            case .success(let imageData):
                self.view.imageData(imageData: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
