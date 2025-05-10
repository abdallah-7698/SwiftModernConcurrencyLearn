//
//  ContentView.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User

    var body: some View {
        List {
            Section(header: Text("Profile").font(.title2)) {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text(user.name).font(.headline)
                        Text(user.email).font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }

            Section(header: Text("Basic Info")) {
                Label("Age: \(user.age)", systemImage: "calendar")
                Label("Joined: \(formatted(dateString: user.accountStatus.createdAt))", systemImage: "clock")
                Label("Last Login: \(formatted(dateString: user.accountStatus.lastLogin))", systemImage: "clock.arrow.circlepath")
            }

            Section(header: Text("Address")) {
                Text(user.address.fullAddress)
                    .font(.body)
            }

            Section(header: Text("Phone Numbers")) {
                ForEach(user.phoneNumbers, id: \.number) { phone in
                    Label("\(phone.type.capitalized): \(phone.number)", systemImage: "phone")
                }
            }

            Section(header: Text("Preferences")) {
                Label("Newsletter: \(user.preferences.newsletter ? "Yes" : "No")", systemImage: "envelope")
                Label("Email Notifications: \(user.preferences.notifications.email ? "On" : "Off")", systemImage: "bell")
                Label("SMS Notifications: \(user.preferences.notifications.sms ? "On" : "Off")", systemImage: "message")
                Label("Theme: \(user.preferences.theme.capitalized)", systemImage: "paintpalette")
            }

            Section(header: Text("Roles")) {
                ForEach(user.roles, id: \.self) { role in
                    Label(role.capitalized, systemImage: "person.fill")
                }
            }

            Section(header: Text("Notes")) {
                Text(user.notes).font(.callout)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("User Details")
    }

    func formatted(dateString: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        if let date = isoFormatter.date(from: dateString) {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
        return dateString
    }
}


#Preview {
    UserDetailsView(user: User(
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
    ))
}
