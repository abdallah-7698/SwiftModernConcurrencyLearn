import Foundation

struct UserRequest: RequestType {
 
    public var baseUrl: URL
    public var path: String = String()
    public var method: String = "GET"
    
    var validStatusCode: [Int] = [200]
        
    public let responseDecoder: (Data) throws -> User = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
    // get the url
    init (baseUrl: URL) {  self.baseUrl = baseUrl }
}
