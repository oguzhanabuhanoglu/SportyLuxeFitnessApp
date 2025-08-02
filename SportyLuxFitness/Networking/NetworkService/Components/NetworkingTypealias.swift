//
//  NetworkingTypealias.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

public typealias CompletionHandler<T:Codable> = (_ result: Result<T,NetworkError>) -> Void

public typealias Percentage = Double

public typealias ProgressHandler = (Percentage) -> Void

public typealias Parameters = [String: Any]


extension Parameters {
    var asURLPath: String {
        return self.map {"\($1)"}
        .joined(separator: "/")
        .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
    }
}
