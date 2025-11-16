//
//  Flute_The_AppApp.swift
//  Flute The App
//
//  Created by ipad on 16/11/25.
//

import SwiftUI
@main
struct Flute_The_AppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
