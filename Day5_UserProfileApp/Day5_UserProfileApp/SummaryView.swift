//
//  SummaryView.swift
//  Day5_UserProfileApp
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

struct SummaryView: View {
    let user: User
    let imageData: Data?

    var body: some View {
        VStack(spacing: 20) {
            Spacer(minLength: 30)

            
            VStack(spacing: 16) {
                
                if let data = imageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 4)
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 4)
                }

                
                Text(user.name)
                    .font(.title2)
                    .fontWeight(.semibold)

                
                Text(user.designation)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Divider()

                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text(user.email)
                    }
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                        Text("Age: \(user.age)")
                    }
                    HStack {
                        Image(systemName: "building.2.crop.circle")
                            .foregroundColor(.blue)
                        Text("Department: \(user.department)")
                    }
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.blue)
                        Text("Location: \(user.location)")
                    }
                    HStack {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(user.isActive ? .green : .red)
                        Text(user.isActive ? "Active" : "Inactive")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .gray.opacity(0.3), radius: 8, x: 0, y: 4)
            .padding(.horizontal)

            Spacer()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Employee ID")
    }
}

#Preview {
    SummaryView(
        user: User(
            name: "Sundar",
            email: "sundar@email.com",
            isActive: true,
            age: "28",
            designation: "iOS Developer",
            department: "Engineering",
            location: "Chennai"
        ),
        imageData: nil
    )
}
