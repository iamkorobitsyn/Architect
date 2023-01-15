//
//  CleanSwiftDetaliPresenter.swift
//  Architect
//
//  Created by Александр Коробицын on 14.01.2023.
//

import Foundation

protocol CleanSwiftDetailVCPresentationLogic {
    func presentUser(respounce: DetailVC.ShowDetails.Respounse)
    func presentStatus(respounce: DetailVC.SetStatus.Status)
}

class CleanSwiftDetailVCPresenter: CleanSwiftDetailVCPresentationLogic {
   
    weak var viewController: CleanSwiftDetailVC?
    
    func presentUser(respounce: DetailVC.ShowDetails.Respounse) {
        
        let viewModel = DetailVC.ShowDetails.ViewModel(nameSurename:
                                                        "\(respounce.name) \(respounce.Surename)",
                                                       age: String(respounce.age),
                                                       gender: respounce.gender,
                                                       mail: respounce.mail)
        self.viewController?.displayDetailVC(display: viewModel)
        
        CleanSwiftNetworkManager.instance.fetchImage(url: respounce.image) { result in
            switch result {
                
            case .success(let imageData):
                let imageData = DetailVC.ShowDetails.ImageData(image: imageData)
                self.viewController?.displayImage(display: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func presentStatus(respounce: DetailVC.SetStatus.Status) {
        self.viewController?.displayFavoriteStatus(display: respounce)
    }

}
