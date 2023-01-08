//
//  StorageManager.swift
//  Architect
//
//  Created by Александр Коробицын on 19.11.2022.
//

import Foundation

class MVVMStorageManager {
    static let instance = MVVMStorageManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults()
    
    func setFavoriteStatus(for name: String, for status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func getFavoriteStatus(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
}


