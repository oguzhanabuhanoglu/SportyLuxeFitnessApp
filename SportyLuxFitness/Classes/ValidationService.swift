//
//  ValidationService.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import Foundation

class ValidationService {
    
    func validatePhoneNumber(_ phoneNumber: String?) throws -> String {
        guard var phoneNumber = phoneNumber, !phoneNumber.isEmpty else {throw ValidationError.invalidPhoneNumber}
        guard phoneNumber.count >= 10 else {throw ValidationError.invalidPhoneNumber}
        guard phoneNumber.hasPrefix("5") else {throw ValidationError.invalidPhoneNumber}
        if !phoneNumber.hasPrefix("+90") {
            phoneNumber = "+90" + phoneNumber
        }
        return phoneNumber
    }
    
}

enum ValidationError: String, LocalizedError {
    case invalidPhoneNumber = "Geçersiz Telefon numarası"
    
    var errorDescription: String? {
        self.rawValue
    }
}

