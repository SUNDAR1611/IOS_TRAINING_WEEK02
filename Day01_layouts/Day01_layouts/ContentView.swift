
//
//  ContentView.swift
//  ProfileCardView
//
//  Created by cs_ios on 24/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.7), .purple]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .background(Circle().fill(Color.white.opacity(0.2)))
                    .padding()
                
                Text("Sundar N")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Text("iOS Developer")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(Color.blue)
                    Text("linkedin.com/in/sundarn")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }

                Divider().background(Color.white)

                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.green)
                    Text("+91 89409 07335")
                        .foregroundColor(.white)
                }

                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.yellow)
                    Text("sundar@example.com")
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.3))
                .shadow(radius: 10))
            .padding()
        }
    }
}
