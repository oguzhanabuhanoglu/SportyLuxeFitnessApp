//
//  Network.swift
//  Eksperden
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

struct Network {
    static func request<T: Codable>(endpoint: Endpoint, responseModel: T.Type, completion: @escaping CompletionHandler<T>, progressHandler: ProgressHandler? = nil) {
        
        retryableRequest(endpoint: endpoint, responseModel: responseModel, completion: completion, progressHandler: progressHandler)
        
        func retryableRequest<T: Codable>(endpoint: Endpoint, responseModel: T.Type, completion: @escaping CompletionHandler<T>, progressHandler: ProgressHandler? = nil, retries: Int = 3) {
           NetworkService.shared.request(endpoint: endpoint, responseModel: responseModel, completion: {  result in
               
               switch result {
               case .success(let response):
                   completion(.success(response))
                   
               case .failure(let error):
                   switch error {
                   case .unauthorized:
                       if retries > 0 {                           
                           NSLog("⚠️ Token expired trying to refresh, retries: \(retries)")
           
//                           AuthManager.shared.refreshToken {
//                               retryableRequest(endpoint: endpoint,
//                                       responseModel: responseModel,
//                                       completion: completion,
//                                       progressHandler: progressHandler,
//                                       retries: retries - 1)
//                           }
                           
                       } else {
                           UserManager.shared.kickOutUser()
                           completion(.failure(.refreshTokenFailed))
                       }
                   
                       
                       
                   default:
                       completion(.failure(error))
                   }
               }
           }, progressHandler: progressHandler)
           
       }
    }
    
    
}
