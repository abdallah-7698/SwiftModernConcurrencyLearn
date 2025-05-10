//
//  UserListView.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import SwiftUI

struct UserListView: View {
    let users: [User]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(users, id: \.id) { user in
                        NavigationLink(destination: UserDetailsView(user: user)) {
                            UserCardView(user: user)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView(users: [
        User(
            id: 1,
            name: "Lisa Green",
            email: "lisa.green@sample.org",
            age: 52,
            timestamp: "2025-05-09T01:11:02Z",
            address: Address(
                street: "9235 Sunset Boulevard",
                city: "Chicago",
                state: "IL",
                zipcode: "60692"
            ),
            phoneNumbers: [
                PhoneNumber(type: "home", number: "469-229-8127")
            ],
            preferences: Preferences(
                newsletter: true,
                notifications: Notifications(email: false, sms: false),
                theme: "light"
            ),
            accountStatus: AccountStatus(
                active: true,
                createdAt: "2022-03-23T16:05:49Z",
                lastLogin: "2025-05-01T12:39:27Z"
            ),
            roles: ["user"],
            notes: "Educational account for classroom use."
        ),
        User(
            id: 2,
            name: "John Smith",
            email: "john.smith@sample.org",
            age: 45,
            timestamp: "2025-05-09T01:11:02Z",
            address: Address(
                street: "10 Main Street",
                city: "New York",
                state: "NY",
                zipcode: "10001"
            ),
            phoneNumbers: [
                PhoneNumber(type: "mobile", number: "212-555-0198")
            ],
            preferences: Preferences(
                newsletter: false,
                notifications: Notifications(email: true, sms: true),
                theme: "dark"
            ),
            accountStatus: AccountStatus(
                active: false,
                createdAt: "2021-01-10T09:15:00Z",
                lastLogin: "2023-12-20T22:00:00Z"
            ),
            roles: ["admin"],
            notes: "Admin account with limited access."
        )
    ])
}
