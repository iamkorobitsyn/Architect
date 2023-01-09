//
//  CleanSwiftMainVCModels.swift
//  Architect
//
//  Created by Александр Коробицын on 09.01.2023.
//

import Foundation

protocol CellIdentifiable {
    var identifire: String {get}
    var height: Double {get}
}

enum MainVC {
    
    //MARK: - UseCases
    
    enum ShowUsers {
        
        struct Respounce {
            let users: [CleanSwiftUser]
        }
        
        struct ViewModel {
            
            struct CellViewModel: CellIdentifiable {
                
                let nameSurename: String
                
                var identifire: String {
                    "cell"
                }
                var height: Double {
                    80
                }
                
                init(user: CleanSwiftUser) {
                    self.nameSurename = "\(user.firstName) \(user.lastName)"
                }
            }
            
            let rows: [CellViewModel]
        }
    }
    
}
