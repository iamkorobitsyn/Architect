//
//  MVPModels.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

struct MVPFetchObjects: Decodable {
    let users: [MVPUser]
}

struct MVPUser: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let image: String
}
