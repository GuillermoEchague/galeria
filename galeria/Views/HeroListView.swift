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
                            HStack(spacing: 16) {
                                // Imagen del héroe
                                AsyncImage(url: URL(string: hero.imagen)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 80, height: 80) // Tamaño de la imagen
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                                // Información del héroe
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(hero.nombre)
                                        .font(.headline)

                                    Text("Primera aparición:")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    Text(hero.primeraAparicion)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .listStyle(PlainListStyle()) // Diseño más limpio para la lista
                }
            }
            .onAppear {
                viewModel.fetchHeroes()
            }
            .navigationTitle("Héroes")
        }
    }
}
