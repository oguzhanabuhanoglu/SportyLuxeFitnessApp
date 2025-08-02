//
//  UIApplication-getWindow.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 1.08.2025.
//

import UIKit

extension UIApplication {
    
    func getWindow() -> UIWindow? {
        if let window =  UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first {
            return window
        }
        else {
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        }
    }
    
     func getSceneDelegate() -> SceneDelegate? {
        let scene = UIApplication.shared.connectedScenes.first
        return scene?.delegate as? SceneDelegate
    }
    
}
