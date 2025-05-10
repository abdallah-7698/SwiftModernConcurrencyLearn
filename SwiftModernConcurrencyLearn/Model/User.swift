//
//  User.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//
import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let email: String
    let age: Int
    let timestamp: String
    let address: Address
    let phoneNumbers: [PhoneNumber]
    let preferences: Preferences
    let accountStatus: AccountStatus
    let roles: [String]
    let notes: String
}

struct Address: Codable {
    let street, city, state, zipcode: String

    var fullAddress: String {
        "\(street), \(city), \(state) \(zipcode)"
    }
}

struct PhoneNumber: Codable {
    let type: String
    let number: String
}

struct Preferences: Codable {
    let newsletter: Bool
    let notifications: Notifications
    let theme: String
}

struct Notifications: Codable {
    let email, sms: Bool
}

struct AccountStatus: Codable {
    let active: Bool
    let createdAt, lastLogin: String

    enum CodingKeys: String, CodingKey {
        case active
        case createdAt = "created_at"
        case lastLogin = "last_login"
    }
}
