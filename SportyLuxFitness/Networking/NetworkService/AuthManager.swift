//
//  AuthManager.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation
import KeychainSwift

open class AuthManager {
    
    private init() {}
    
    public static let shared = AuthManager()
    
    private let keychain = KeychainSwift()
    
    private let accessTokenKey = "AuthManager.user.accessTokenKey"
    
    private let refreshTokenKey = "AuthManager.user.refreshTokenKey"
    
    private let fcmTokenKey = "AuthManager.user.fcmTokenKey"
            
    
//    func refreshToken(completion: @escaping (()-> Void)) {
//        Network.request(endpoint: AuthorizationEndpoint.refreshAccessToken(refreshToken: refreshToken ?? ""),
//                       responseModel: LoginModel.self,
//                       completion: { [weak self] result in
//            
//            switch result {
//            case.success(let data):
//                self?.accessToken = data.token
//                self?.refreshToken = data.refreshToken
//                UserManager.shared.saveUserData(data.user)
//                
//            case .failure(let error):
//                print(error)
//            }
//
//            completion()
//        })
//    }

    //MARK: - AccessToken
    public var accessToken: String? {
        get {
            return keychain.get(accessTokenSecretKey)
        }
        set {
            guard let newValue = newValue else {return}
            keychain.set(newValue, forKey: accessTokenSecretKey)
            debugPrint("New Token Assigned")
        }
    }
    
    private var accessTokenSecretKey: String {
        let container: UserDefaults = .standard
        
        guard let secretKey = container.string(forKey: accessTokenKey), !secretKey.isEmpty else {
            let uuid = UUID().uuidString
            let newSecretKey = "\(accessTokenKey)-\(uuid)"
            container.setValue(newSecretKey, forKey: accessTokenKey)
            return newSecretKey
        }
        
        return secretKey
    }
   
    
    //MARK: - Refresh Token
    public var refreshToken: String? {
        get {
            return keychain.get(refreshTokenSecretKey)
        }
        set {
            guard let newValue = newValue else {return}
            keychain.set(newValue, forKey: refreshTokenSecretKey)
        }
    }
    
    private var refreshTokenSecretKey: String {
        let container: UserDefaults = .standard
        
        guard let secretKey = container.string(forKey: refreshTokenKey), !secretKey.isEmpty else {
            let uuid = UUID().uuidString
            let newSecretKey = "\(refreshTokenKey)-\(uuid)"
            container.setValue(newSecretKey, forKey: refreshTokenKey)
            return newSecretKey
        }
        
        return secretKey
    }
    
    public func deleteCurrentAuth() {
        keychain.delete(accessTokenSecretKey)
    }
   
    //MARK: - FCM Token
    public var fcmToken: String? {
        get {
            return keychain.get(fcmTokenSecretKey)
        }
        set {
            guard let newValue = newValue else {return}
            keychain.set(newValue, forKey: fcmTokenSecretKey)
        }
    }
    
    private var fcmTokenSecretKey: String {
        let container: UserDefaults = .standard
        
        guard let secretKey = container.string(forKey: fcmTokenKey), !secretKey.isEmpty else {
            let uuid = UUID().uuidString
            let newSecretKey = "\(fcmTokenKey)-\(uuid)"
            container.setValue(newSecretKey, forKey: fcmTokenKey)
            return newSecretKey
        }
        
        return secretKey
    }
}
