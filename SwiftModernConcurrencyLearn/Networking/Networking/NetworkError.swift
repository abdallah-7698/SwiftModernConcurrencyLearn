import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case timeOutRequest
}
