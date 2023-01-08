//
//  VIPERMainCellViewModel.swift
//  Architect
//
//  Created by Александр Коробицын on 30.12.2022.
//

import Foundation

protocol VIPERMainCellIdentifiable {
    var cellID: String {get}
    var cellHeight: Double {get}
}

protocol VIPERMainSectionRepresentable {
    var rows: [VIPERMainCellIdentifiable] {get set}
}

class VIPERMainCellViewModel: VIPERMainCellIdentifiable {
    
    init(user: VIPERUser) {
        self.user = user
    }
    
    private let user: VIPERUser
    
    var nameSurename: String {
        "\(user.firstName) \(user.lastName)"
    }
    
    var cellID: String {
        "cell"
    }
    
    var cellHeight: Double {
        80
    }
    
    func fetchImage(completion: @escaping(Data) -> Void) {
        VIPERNetworkManager.instance.fetchImage(url: user.image) { result in
            switch result {
                
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}

class VIPERMainSectionViewModel: VIPERMainSectionRepresentable {
    var rows: [VIPERMainCellIdentifiable] = []
}
