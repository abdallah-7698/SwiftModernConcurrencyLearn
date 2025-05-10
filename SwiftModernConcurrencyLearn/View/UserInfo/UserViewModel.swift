//
//  UserViewModel.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User = User(
        id: 0,
        name: "",
        email: "",
        age: 0,
        timestamp: "",
        address: Address(
            street: "",
            city: "",
            state: "",
            zipcode: ""
        ),
        phoneNumbers: [],
        preferences: Preferences(
            newsletter: false,
            notifications: Notifications(email: false, sms: false),
            theme: ""
        ),
        accountStatus: AccountStatus(
            active: false,
            createdAt: "",
            lastLogin: ""
        ),
        roles: [""],
        notes: ""
    )
    
    init() {}
    
    func getUser(baseUrl: URL) {
        Task {
            do {
                user = try await UserRequest(baseUrl: baseUrl).perform()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
