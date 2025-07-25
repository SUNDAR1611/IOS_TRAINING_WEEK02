//
//  Day02_StateManagementApp.swift
//  Day02_StateManagement
//
//  Created by cs_ios on 25/07/25.
//

import SwiftUI

@main
struct Day02_StateManagementApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ToggleView()
                // Or: CounterView()
            }
        }
    }
}
