//
//  CleanSwiftModels.swift
//  Architect
//
//  Created by Александр Коробицын on 20.11.2022.
//

import Foundation

struct CleanSwiftFetchObjects: Decodable {
    let users: [CleanSwiftUser]
}

struct CleanSwiftUser: Decodable {
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let image: String
}
