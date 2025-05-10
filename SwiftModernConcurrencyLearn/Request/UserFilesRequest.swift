//
//  UserFilesRequest.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import Foundation

struct UserFilesRequest: RequestType {
 
    public var baseUrl: URL {URL(string: "http://localhost:8080/")!}
    public var path: String { "index.json" }
    public var method: String = "GET"
    
    var validStatusCode: [Int] = [200]
    
    public let responseDecoder: (Data) throws -> UserFilesResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
}
