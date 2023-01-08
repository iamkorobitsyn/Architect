//
//  VIPERModels.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

struct VIPERFetchObjects: Decodable {
    let users: [VIPERUser]
}

struct VIPERUser: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let image: String
}
