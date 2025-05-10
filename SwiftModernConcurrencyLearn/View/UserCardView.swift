//
//  UserCardView.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//


import SwiftUI

struct UserCardView: View {
    let user: User

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.indigo)

            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(user.address.city)
                    .font(.caption)
                    .foregroundColor(.blue)
            }

            Spacer()

            Circle()
                .fill(user.accountStatus.active ? Color.green : Color.red)
                .frame(width: 12, height: 12)
                .overlay(
                    Image(systemName: user.accountStatus.active ? "checkmark" : "xmark")
                        .font(.caption2)
                        .foregroundColor(.white)
                )
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(uiColor: .secondarySystemBackground))
                .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
        )
        .contentShape(Rectangle()) // for tappable area
        .animation(.easeInOut(duration: 0.2), value: user.id)
    }
}

#Preview {
    UserCardView(user: User(
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
        phoneNumbers: [],
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
