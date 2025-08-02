//
//  Endpoint.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

public protocol Endpoint {
    
    /// The endpoint base `URL`.
    var baseURL: URL { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: ServerPaths { get }
    
    /// The HTTP method used in the request.
    var method: RequestMethod { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
    
    /// The default parameters
    var defaultParameters: Parameters { get }
    
    /// The type of HTTP task to be performed.
    var task: RequestTask { get }
            
}

extension Endpoint {
    
    public var baseURL: URL {
        return ServerPaths.serverURL
    }
                   
    public var defaultParameters: Parameters {
        let parameters = Parameters()
        return parameters
    }
  
}

extension Endpoint {
    
    func buildAsURLRequest() throws -> URLRequest {
        do {
            var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path.rawValue),
                                        cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                        timeoutInterval: 100)
            urlRequest.httpMethod = method.rawValue
            
            headers?.forEach { urlRequest.addValue($1, forHTTPHeaderField: $0) }
            
            print("📍 Request method:", method.rawValue)
            print("📍 Full URL:", urlRequest.url?.absoluteString ?? "")
            print("📍 Headers:", headers ?? [:])
            
            urlRequest = try buildRequestParams(urlRequest, task: task)
            
            return urlRequest
        }
        catch {
            throw error
        }
    }
    
    
    
    fileprivate func buildRequestParams(_ urlRequest: URLRequest, task: RequestTask) throws -> URLRequest {
        var request = urlRequest
        
        var components = URLComponents()
        components.scheme = ServerPaths.scheme
        components.host = ServerPaths.host
        components.path = "/" + path.rawValue
        print("Path:", components.path)
        
        switch task {
        case .dataTask(let parameters, let encoding):
            print("📦 DataTask seçildi. Parametreler:", parameters ?? [:])
            guard let parameters = parameters else {return request}
            print("📦 Parameters:", parameters)
            switch encoding {
            case .PathAppending:
                components.path += "/\(parameters.asURLPath)"
                guard let url = components.url else { throw NetworkError.invalidURL }
                request.url = url
                
                
            case .URLEncoding:
                components.queryItems = parameters.map { URLQueryItem(name: $0, value: "\($1)") }
                guard let url = components.url else { throw NetworkError.invalidURL }
                request.url = url
                
                
            case .JSONEncoding:
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                
            }
            
        case .uploadTask(let parameters, let media):
            print("📦 UploadTask seçildi. Parametreler:", parameters ?? [:])
            print("📦 Media count:", media.count)
            for m in media {
                print("📁 Media:", m.key, m.filename, m.mimeType, "Data size:", m.data.count)
            }
            let boundary = String().generateBoundary()
            
            if let p = parameters {
                print("📦 Parameters:", p)
            }
            
            let dataBody = createDataBody(withParameters: parameters, media: media, boundary: boundary)
            
            request.allHTTPHeaderFields?["Content-Type"] = "multipart/form-data; boundary=\(boundary)"
            request.addValue("\(dataBody.count)", forHTTPHeaderField: "content-length")
            
            request.httpBody = dataBody
        }
        
        
        
        return request
    }
    
    
    func createDataBody(withParameters params: Parameters?, media: [Media]?, boundary: String) -> Data {
        
        let lineBreak = "\r\n"
        var body = Data()
        
        if let parameters = params {
            for (key, value) in parameters {
                print("📨 Param: \(key): \(value)")
                    var stringValue = String()
                    if let str = value as? String { stringValue = str }
                    else if let int = value as? Int { stringValue = "\(int)"}
                    else {stringValue = "\(value)"}
                    
                    body.append("--\(boundary + lineBreak)")
                    body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                    body.append("\(stringValue + lineBreak)")
            }
            
        }
        
        if let media = media {
            for photo in media {
                print("🖼 Media ekleniyor - Key: \(photo.key), Name: \(photo.filename), Size: \(photo.data.count)")
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.filename)\"\(lineBreak)")
                body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
                body.append(photo.data)
                body.append(lineBreak)
            }
        }
        
        if let media = media {
            for photo in media {
                print("📤 Dosya Gönderiliyor:")
                print("   🔹 Key: \(photo.key)")
                print("   🔹 Filename: \(photo.filename)")
                print("   🔹 Mime Type: \(photo.mimeType)")
                print("   🔹 Dosya Boyutu: \(photo.data.count) byte")
            }
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
    
}

extension String {
    func generateBoundary() -> String {
        return "elephantapps.boundary-\(NSUUID().uuidString)"
    }
}



extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}




//protocol ParameterEncoding {
//    func encode(_ urlRequest: URLRequest, task: RequestTask) throws -> URLRequest
//}

//struct JSONEncoding: ParameterEncoding {
//    func encode(_ urlRequest: URLRequest, task: RequestTask) throws -> URLRequest {
////        components.queryItems = parameters.map { URLQueryItem(name: $0, value: "\($1)") }
////        guard let url = components.url else { throw NetworkError.invalidURL }
////        request.url = url
////
////        urlRequest
//        var request = urlRequest
//        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//        return request
//    }
//
//
//}
