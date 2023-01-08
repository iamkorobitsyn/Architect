//
//  MVPStorageManager.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

class MVPStorageManager {
    static let instance = MVPStorageManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults()
    
    func setFavoriteStatus(for name: String, for status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func getFavoriteStatus(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
}
