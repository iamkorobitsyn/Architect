//
//  CleanSwiftDetailVCRouter.swift
//  Architect
//
//  Created by Александр Коробицын on 14.01.2023.
//

import Foundation

protocol CleanSwiftDetailDataPassing {
    var dataStore: CleanSwiftDetailVCDataStore? { get set}
}


class CleanSwiftDetalVCRouter: CleanSwiftDetailDataPassing {
    
    var dataStore: CleanSwiftDetailVCDataStore?
    
}
