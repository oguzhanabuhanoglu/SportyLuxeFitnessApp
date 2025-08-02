//
//  NetworkError.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

public enum NetworkError: LocalizedError {
  
    case decode(Error)
   
    case invalidURL
    
    case noData
    
    case noResponse
    
    case unauthorized
    
    case unexpectedError(error: Error?)
    
    case unexpectedStatusCode(statusCode: Int)
        
    case responseError(message: String?)
            
    case noInternetConnection
            
    case buildingURLRequestError(error: Error)
    
    case refreshTokenFailed
        
    public var errorDescription: String? {
        switch self {
        case .responseError(let message):
            return message ?? "Unknown error"
    
        case .unexpectedStatusCode(let statusCode):
            return "Server error status code: \(statusCode)"
            
        case .unexpectedError(let error):
            return "Unexpected Error \(error?.localizedDescription ?? "unknown")"
    
        default:
            return "\(self)"
        }
    }
}
