//
//  GreetingDetailView.swift
//  Day04_Navigation
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

struct GreetingDetailView: View {
    let name: String

    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, \(name)!")
                .font(.largeTitle)
                .bold()

            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)

            Text("developer")
                .font(.subheadline)
                .foregroundColor(.gray)

            VStack {
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(Color.blue)
                    
                    Text("linkedin.com/in/\(name)")
                        .gridCellAnchor(.bottom)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                    Spacer()
            
            }
        }
        .padding()
        .navigationTitle("Greeting")
    }
}


#Preview {
    GreetingDetailView(name: "Preview")
}
