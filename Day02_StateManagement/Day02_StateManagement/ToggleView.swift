//
//  ToggleView.swift
//  Day02_StateManagement
//
//  Created by cs_ios on 25/07/25.
//


import SwiftUI

struct ToggleView: View {
    @State private var isMessageVisible = false
    @State private var visitCount = 0

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Toggle("Show Message", isOn: $isMessageVisible)
                    .padding()

                if isMessageVisible {
                   
                        Text("Hello, SwiftUI!")
                            .font(.title2)
                    
                    
                }

                NavigationLink(
                    destination: ChildView(
                        isVisible: $isMessageVisible,
                        visitCount: $visitCount
                    )
                ) {
                    
                        Text("Go to Detail View")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(8)
                    
                    
                }
                  
                      Text("Child View visited: \(visitCount) times")
                          .font(.subheadline)
                          .foregroundColor(.gray)

                      Spacer()
                
                
            }
            .navigationTitle("parent mode!")
            .padding()
        }
    }
}



