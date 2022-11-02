//
//  UserModel.swift
//  User
//
//  Created by Eren on 9/1/22.
//

import Foundation


struct UserModel: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
}

