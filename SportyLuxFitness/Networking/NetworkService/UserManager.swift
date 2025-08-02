//
//  UserManager.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation
import UIKit

enum UserKeys: String {
    case userInfo = "com.mambaapps.sportylux.user"
    case fcmToken = "com.mambaapps.sportylux.fcmToken"
}


class UserManager {
    //MARK: - Initialization
    private init() {}
    
    //MARK: - Properties
    public static let shared = UserManager()
    
    static var isUserLoggedIn: Bool {
        get {
            UserManager.shared.currentData() != nil
        }
    }
    
    //MARK: - Functions
    func currentData() -> UserModel? {
        guard let userData = UserDefaults.standard.data(forKey: UserKeys.userInfo.rawValue) else {return nil}
        let decoder = JSONDecoder.init()
        do {
            let decodedData = try decoder.decode(UserModel.self, from: userData)
            return decodedData
        }
        catch {
            postError(error)
            return nil
        }
    }
    
    func saveUserData(_ userModel: UserModel) {
        let encoder = JSONEncoder()
        do {
            let encodedUser = try encoder.encode(userModel)
            UserDefaults.standard.setValue(encodedUser, forKey: UserKeys.userInfo.rawValue)
        }
        catch {
            postError(error)
        }
    }
 
    
    func deleteAllData() {
        AuthManager.shared.deleteCurrentAuth()
//        UserDefaults.hasSubscribedToNotification = false
        UserDefaults.standard.removeObject(forKey: UserKeys.fcmToken.rawValue)
        UserDefaults.standard.removeObject(forKey: UserKeys.userInfo.rawValue)
    }
    
    
    func kickOutUser() {
        UserManager.shared.deleteAllData()
    
        let window = UIApplication.shared.getWindow()
                
        let scene = UIApplication.shared.connectedScenes.first
        let sceneDelegate = scene?.delegate as? SceneDelegate
        let coordinator = sceneDelegate?.coordinator
        
        coordinator?.start()
    }
    
    func postError(_ error: Error) {
        print(error.localizedDescription)
    }
}


