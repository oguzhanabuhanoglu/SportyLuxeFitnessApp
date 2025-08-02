//
//  UIFont-ext.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import UIKit

enum FontStyle {
    case regular(CGFloat)
    case medium(CGFloat)
    case semiBold(CGFloat)
    case bold(CGFloat)
    case extraBold(CGFloat)
}


extension UIFont {
    static func poppins(_ style: FontStyle) -> UIFont {
        switch style {
        case .regular(let size):
            return UIFont(name: "Poppins-Regular", size: size)!
        case .medium(let size):
            return UIFont(name: "Poppins-Medium", size: size)!
        case .semiBold(let size):
            return UIFont(name: "Poppins-SemiBold", size: size)!
        case .bold(let size):
            return UIFont(name: "Poppins-Bold", size: size)!
        case .extraBold(let size):
            return UIFont(name: "Poppins-ExtraBold", size: size)!
        }
    }
}
