//
//  LoginModel.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

struct LoginModel: Codable {
    let user: UserModel
    
    let token: String
    
//    let refreshToken: String?
//    
//    let navigateTo: NavigateToModel?
}

//enum NavigateToModel: String, Codable {
//    case home
//    case expert
//    case gallery
//}
