//
//  MediaModel.swift
//  NetworkService
//
//  Created by Oğuzhan Abuhanoğlu on 31.07.2025.
//

import UIKit

public struct Media {
    public var key = String()
    
    public var filename = String()
    
    public var data = Data()
    
    public var mimeType = String()
    
    public var image: UIImage?
    
    public var id: Int?
    
    public var url: String?
    
    public init(key: String = String(), filename: String = String(), data: Data = Data(), mimeType: String = String(), image: UIImage? = nil, id: Int? = nil, url: String? = nil) {
        self.key = key
        self.filename = filename
        self.data = data
        self.mimeType = mimeType
        self.image = image
        self.id = id
        self.url = url
    }

}
