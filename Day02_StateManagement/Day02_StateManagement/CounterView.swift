//
//  CounterView.swift
//  Day02_StateManagement
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

struct CounterView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 20) {
            Text("Counter")
                .font(.largeTitle)
                .bold()

            Text("\(count)")
                .font(.system(size: 50))
                .foregroundColor(.blue)

            HStack(spacing: 40) {
                Button(action: {
                    count -= 1
                }) {
                    Text("-")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    count += 1
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            Spacer()
        }
        .padding()
    }
}
