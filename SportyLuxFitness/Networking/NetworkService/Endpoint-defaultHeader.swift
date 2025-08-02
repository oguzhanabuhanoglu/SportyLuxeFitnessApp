//
//  Endpoint-defaultHeader.swift
//  Eksperden
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

extension Endpoint {
    var defaultHeader: [String: String] {
        var header = [String: String]()
        header["Content-Type"] = "application/json"
        header["accept"] = "application/json"
        //header["accept-language"] = "tr_TR"
        
        if let token = AuthManager.shared.accessToken {
            header["Authorization"] = "Bearer \(token)"
        }
        
        return header
    }
}
