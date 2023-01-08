//
//  VIPERStorageManager.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

class VIPERStorageManager {
    static let instance = VIPERStorageManager()
    
    private init() {}
    
    private var users: [VIPERUser] = []
    
    private let userDefaults = UserDefaults()
    
    func setFavoriteStatus(for name: String, for status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func getFavoriteStatus(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
    
    func setUsers(users: [VIPERUser]) {
        self.users = users
    }
    
    func getUser(indexPath: IndexPath) -> VIPERUser {
        users[indexPath.row]
    }
}
