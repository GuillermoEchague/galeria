//
//  HeroListView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation
import SwiftUI

struct HeroListView: View {
    @StateObject private var viewModel = HeroListViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando héroes...")
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    List(viewModel.heroes) { hero in
                        NavigationLink(destination: HeroDetailView(hero: hero)) {
                            HeroRowView(hero: hero)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear {
                viewModel.fetchHeroes()
            }
            .navigationTitle("Héroes")
        }
    }
}
