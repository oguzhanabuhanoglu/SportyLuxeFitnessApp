//
//  ValidationService.swift
//  SportyLuxFitness
//
//  Created by Oğuzhan Abuhanoğlu on 2.08.2025.
//

import Foundation

class ValidationService {
    
    func validatePhoneNumber(_ phoneNumber: String?) throws -> String {
        guard let phoneNumber = phoneNumber, !phoneNumber.isEmpty else {throw ValidationError.invalidPhoneNumber}
        guard phoneNumber.count >= 10 else {throw ValidationError.invalidPhoneNumber}
        return phoneNumber
    }
    
}

enum ValidationError: String, LocalizedError {
    case invalidPhoneNumber = "Geçersiz Telefon numarası"
    
    var errorDescription: String? {
        self.rawValue
    }
}

