//
//  EcommerceApp.swift
//  Ecommerce
//
//  Created by Avinash on 18/09/2024.
//

import SwiftUI
import SwiftData

@main
struct EcommerceApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([ ProductItem.self, ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(sharedModelContainer)
    }
}
