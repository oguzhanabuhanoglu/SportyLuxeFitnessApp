//
//  NetworkService.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import UIKit

public class NetworkService: NSObject {
    
    public static let shared = NetworkService()
    
    private override init() {}
    
    lazy var session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: .main)
    
    private var progressHandlersByTaskID = [Int : ProgressHandler]()

    public func request<T: Codable>(endpoint: Endpoint, responseModel: T.Type, completion: @escaping CompletionHandler<T>, progressHandler: ProgressHandler? = nil) {
//TODO: HAY -> Following lines are checking internet connecton. however it makes problems when session is expired!
//        guard NetworkMonitor.shared.isConnected else {
//            completion(.failure(.noInternetConnection))
//            return
//        }
                        
        do {
            let request = try endpoint.buildAsURLRequest()
            dataTask(request: request, completion: completion, progressHandler: progressHandler)
        }
        catch {
            print(endpoint.baseURL)
            completion(.failure(NetworkError.buildingURLRequestError(error: error)))
        }
    }
        
    
    private func dataTask<T: Codable>(request: URLRequest, completion: @escaping CompletionHandler<T>, progressHandler: ProgressHandler? = nil) {
        let task = session.dataTask(with: request) { data, response, error in
            
            //Check for data
            guard let jsonData = data else {
                completion(.failure(.noData))
                return
            }
            
            //Check for response type
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            //Check for error
            guard error == nil else {
                completion(.failure(.unexpectedError(error: error)))
                return
            }
            print("📋 Endpoint URL", request.url?.absoluteString ?? "")
            
            do {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                    print("📄 Raw json", json)
                    print(request.allHTTPHeaderFields ?? [])
                }
            }
            catch {
                print("📄 Error printing raw json", error.localizedDescription)
                print("Json Data: \(jsonData)")
            }
            
            //Check for status code
            if (200...299).contains(response.statusCode) {
                do {

                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
                    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSZ"
                    
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    let NetworkResponseModel = try decoder.decode(NetworkResponseModel<T>.self, from: jsonData)

                    completion(.success(NetworkResponseModel.data))

                }
                catch {
                    print("Decode Error")
                    //completion(.failure(.decode(error)))
                    if let data = data, let htmlString = String(data: jsonData, encoding: .utf8) {
                        // Return the HTML content as a string when the status code is 200
                        guard let htmlString = htmlString as? T else { 
                            completion(.failure(.decode(error))) 
                            return 
                        }
                        completion(.success(htmlString as! T))
                    } else {
                        // Handle cases where data is nil or cannot be converted to a string
                        completion(.failure(.decode(error)))
                    }
                }
                
            } else if response.statusCode == 403 {//Token expired
                completion(.failure(.unauthorized))
                
            } else {
                //Check error response details and return the message
                let decoder = JSONDecoder()
                
                if let errorModel = try? decoder.decode(NetworkErrorResponse.self, from: jsonData) {
                    let errorMessages = errorModel.detail?.compactMap(\.msg).joined(separator: ", ")
                    completion(.failure(.responseError(message: errorMessages)))
                    
                } else {
                    completion(.failure(.unexpectedStatusCode(statusCode: response.statusCode)))
                }
            
            }

        }
        
        progressHandlersByTaskID[task.taskIdentifier] = progressHandler
        
        task.resume()
    }
    
}

extension NetworkService: URLSessionTaskDelegate {
    public func urlSession( _ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let progress = Double(totalBytesSent) / Double(totalBytesExpectedToSend)
        let handler = progressHandlersByTaskID[task.taskIdentifier]
        handler?(progress)
    }
}

public struct NetworkResponseModel<T: Codable>: Codable {
    let data: T
}

public struct NetworkErrorResponse: Codable {
    let detail: [ErrorMessage]?
    
    struct ErrorMessage: Codable {
        let msg: String?
    }
}
