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
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)

                Text("Welcome to the Profile App")
                    .font(.title)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: ProfileView()) {
                    Text(" + Add Profile")
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
