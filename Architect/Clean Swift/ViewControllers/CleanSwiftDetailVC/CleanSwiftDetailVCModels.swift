//
//  CleanSwiftDetailModels.swift
//  Architect
//
//  Created by Александр Коробицын on 14.01.2023.
//

import Foundation

enum DetailVC {
    
    enum ShowDetails {
        
        struct Respounse {
            let name: String
            let Surename: String
            let age: Int
            let gender: String
            let mail: String
            let image: String
        }
        
        struct ViewModel {
            let nameSurename: String
            let age: String
            let gender: String
            let mail: String
        }
        
        struct ImageData {
            let image: Data
        }
    }
    
    enum SetStatus {
        struct Status {
            let status: Bool
        }
    }
}
