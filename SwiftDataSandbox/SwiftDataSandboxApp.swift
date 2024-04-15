//
//  SwiftDataSandboxApp.swift
//  SwiftDataSandbox
//
//  Created by gurrium on 2024/04/15.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSandboxApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Shop.self,
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
