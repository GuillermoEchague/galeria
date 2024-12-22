//
//  ContentView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        MainView()
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
