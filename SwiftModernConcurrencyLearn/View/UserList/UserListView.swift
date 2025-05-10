//
//  UserListView.swift
//  SwiftModernConcurrencyLearn
//
//  Created by name on 10/05/2025.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var userListViewModel = UserListViewModel()
    @StateObject private var userViewModle = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach($userListViewModel.userFiles, id: \.self) { userURL in
                        Text("\(userURL.wrappedValue)")
                    //TODO: - Replce the text with the UserDetailsView()
//                        NavigationLink(destination: UserDetailsView(user: $userViewModle.user)) {
//                            UserCardView(user: $userViewModle.user)
//                        }
//                        .buttonStyle(.plain)
                    }

                }
                .padding()
            }
            .navigationTitle("Users")
        }
    }
}
