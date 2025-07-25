//
//  ContentView.swift
//  Day04_Navigation
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

struct ContentView: View {
    let names = ["sundar", "praveen", "sonu", "Daniel", "John"]

    var body: some View {
        NavigationStack {
            List(names, id: \.self) { name in
                NavigationLink(destination: GreetingDetailView(name: name)) {
                    Text(name)
                }
            }
            .navigationTitle("Name List")
        }
    }
}

#Preview {
    ContentView()
}

