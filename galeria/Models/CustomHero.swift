//
//  CustomHero.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation

import CoreData

func createAndSaveHero() {
    let context = CoreDataManager.shared.context

    // Crear un nuevo héroe
    let newHero = CustomHeroEntity(context: context)
    newHero.id = UUID()
    newHero.name = "Iron Man"
    newHero.descriptionText = "El genio, millonario, playboy, filántropo."
    newHero.power = "Super traje"

    do {
        try context.save()
        print("Héroe guardado correctamente.")
    } catch {
        print("Error al guardar el héroe: \(error.localizedDescription)")
    }
}
