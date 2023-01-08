//
//  Models.swift
//  Architect
//
//  Created by Александр Коробицын on 19.11.2022.
//

import Foundation

struct MVVMFetchObjects: Decodable {
    let users: [MVVMUser]
}

struct MVVMUser: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let image: String
}



