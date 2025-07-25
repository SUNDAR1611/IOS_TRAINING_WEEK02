//
//  HomeView.swift
//  Day5_UserProfileApp
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Welcome to the Profile App")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: ProfileView()) {
                    Text("View Profile")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
