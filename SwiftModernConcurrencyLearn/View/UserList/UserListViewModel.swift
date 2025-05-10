//
//  File.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import Foundation

class UserListViewModel: ObservableObject {
    
    @Published var userFiles: [URL] = []
    
    func getData(){
        Task {
            do {
                userFiles = try await UserFilesRequest().perform().userFiles
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
