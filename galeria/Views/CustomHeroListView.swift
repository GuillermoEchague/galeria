//
//  CustomHeroListView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation
import SwiftUI

struct CustomHeroListView: View {
    @StateObject private var viewModel = CustomHeroViewModel()
    @State private var showAddForm = false
    @State private var heroToEdit: CustomHeroEntity?

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.heroes.isEmpty {
                    Text("No hay héroes personalizados.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(viewModel.heroes, id: \.id) { hero in
                            VStack(alignment: .leading) {
                                Text(hero.name ?? "")
                                    .font(.headline)
                                Text(hero.descriptionText ?? "")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("Poder: \(hero.power ?? "Desconocido")")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .onTapGesture {
                                heroToEdit = hero
                                showAddForm = true
                            }
                        }
                        .onDelete(perform: deleteHeroes)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        heroToEdit = nil
                        showAddForm.toggle()
                    }) {
                        Label("Agregar", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddForm) {
                CustomHeroFormView(viewModel: viewModel, heroToEdit: heroToEdit)
            }
            .onAppear {
                viewModel.fetchHeroes()
            }
            .navigationTitle("Héroes Personalizados")
        }
    }

    private func deleteHeroes(at offsets: IndexSet) {
        offsets.map { viewModel.heroes[$0] }.forEach(viewModel.deleteHero)
    }
}
