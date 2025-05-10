//
//  UserViewModel.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import Foundation

class UserViewModel {
    @Published var user: User?
    
    init(baseUrl: URL) { getUser(baseUrl: baseUrl) }
    
    private func getUser(baseUrl: URL) {
        Task {
            do {
                user = try await UserRequest(baseUrl: baseUrl).perform()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
