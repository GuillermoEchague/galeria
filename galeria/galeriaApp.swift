//
//  galeriaApp.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import SwiftUI

@main
struct galeriaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
