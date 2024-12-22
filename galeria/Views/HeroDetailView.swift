//
//  HeroDetailView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation
import SwiftUI

struct HeroDetailView: View {
    @StateObject private var viewModel = HeroDetailViewModel()
    let hero: Hero

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Imagen del héroe
                AsyncImage(url: URL(string: viewModel.heroDetail?.imagen ?? hero.imagen)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)

                // Contenedor de detalles
                VStack(alignment: .leading, spacing: 16) {
                    // Título del héroe
                    Text(viewModel.heroDetail?.nombre ?? hero.nombre)
                        .font(.title)
                        .fontWeight(.bold)

                    // Nombre real
                    if let nombreReal = viewModel.heroDetail?.nombreReal {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nombre Real:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text(nombreReal)
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                    }

                    // Alias
                    if let alias = viewModel.heroDetail?.alias {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Alias:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text(alias.joined(separator: ", "))
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                    }

                    // Poderes
                    if let poderes = viewModel.heroDetail?.poderes {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Poderes:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            ForEach(poderes, id: \.self) { poder in
                                Text("- \(poder)")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    // Primera aparición
                    if let primeraAparicion = viewModel.heroDetail?.primeraAparicion {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Primera Aparición:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text(primeraAparicion)
                                .font(.body)
                                .foregroundColor(.primary)
                        }
                    }

                    // Historia
                    if let historia = viewModel.heroDetail?.historia {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Historia:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            Text(historia)
                                .font(.body)
                                .foregroundColor(.secondary)
                                .lineLimit(nil) // Expande la historia completa
                        }
                    }

                    // Afiliaciones
                    if let afiliaciones = viewModel.heroDetail?.afiliaciones {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Afiliaciones:")
                                .font(.headline)
                                .foregroundColor(.gray)
                            ForEach(afiliaciones, id: \.self) { afiliacion in
                                Text("- \(afiliacion)")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            }
            .padding()
        }
        .background(Color(UIColor.systemGroupedBackground)) // Fondo general
        .navigationTitle(viewModel.heroDetail?.nombre ?? hero.nombre)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchHeroDetail(id: hero.id)
        }
    }
}
