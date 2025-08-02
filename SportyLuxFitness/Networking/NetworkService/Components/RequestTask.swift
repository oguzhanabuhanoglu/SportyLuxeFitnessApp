//
//  RequestTask.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import Foundation

public enum RequestTask {
  
    case dataTask(parameters: Parameters?, encoding: DataTaskEncoding)
   
    case uploadTask(Parameters: Parameters?, media: [Media])
}

public enum DataTaskEncoding {

    case JSONEncoding
    
    case URLEncoding
    
    case PathAppending
}
