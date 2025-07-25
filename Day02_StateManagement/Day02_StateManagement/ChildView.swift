//
//  ChildView.swift
//  Day02_StateManagement
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

struct ChildView: View {
    @Binding var isVisible: Bool
    @Binding var visitCount: Int

    var body: some View {
        VStack(spacing: 30) {
            
            Toggle("Toggle Message Visibility", isOn: $isVisible)
                .padding()

           
            if isVisible {
                
                    Text("Message is Visible")
                        .foregroundColor(.green)
                        .font(.headline)
                
            } else {
               
                    Text("Message is Hidden")
                        .foregroundColor(.red)
                        .font(.headline)
                
            }

          
            
                Text("Visited \(visitCount) times")
                    .font(.subheadline)
                Spacer()
            

            
        }
        .padding()
        .navigationTitle("Child View")
        .onAppear {
            visitCount += 1
        }
    }
}
