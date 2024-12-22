//
//  CustomHeroFormView.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation
import SwiftUI

struct CustomHeroFormView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: CustomHeroViewModel
    var heroToEdit: CustomHeroEntity?

    @State private var name: String = ""
    @State private var description: String = ""
    @State private var power: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nombre")) {
                    TextField("Ingrese el nombre del héroe", text: $name)
                }

                Section(header: Text("Descripción")) {
                    TextField("Ingrese una descripción", text: $description)
                }

                Section(header: Text("Poder")) {
                    TextField("Ingrese el poder del héroe", text: $power)
                }
            }
            .navigationTitle(heroToEdit == nil ? "Agregar Héroe" : "Editar Héroe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Guardar") {
                        if let hero = heroToEdit {
                            viewModel.updateHero(hero: hero, name: name, description: description, power: power)
                        } else {
                            viewModel.addHero(name: name, description: description, power: power)
                        }
                        dismiss()
                    }
                    .disabled(name.isEmpty || description.isEmpty || power.isEmpty)
                }
            }
        }
        .onAppear {
            if let hero = heroToEdit {
                name = hero.name ?? ""
                description = hero.descriptionText ?? ""
                power = hero.power ?? ""
            }
        }
    }
}
