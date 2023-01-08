//
//  CleanSwiftStorageManager.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

class CleanSwiftStorageManager {
    static let instance = CleanSwiftStorageManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults()
    
    func setFavoriteStatus(for name: String, for status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func getFavoriteStatus(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
}
