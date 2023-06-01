//
//  LoginDataModel.swift
//  Meri Money
//
//  Created by Prince Saini on 27/05/23.
//

import Foundation

struct SignUpDataModel: Codable {
    let accessToken,message, tokenType: String
    let expiration: Int
    let user: User
}

struct User: Codable {
    let id: Int
    let name, email: String
}
