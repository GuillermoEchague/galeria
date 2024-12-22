//
//  CustomHeroServices.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation

import CoreData

class CustomHeroService {
    private let context = CoreDataManager.shared.context

    // Crear un nuevo héroe
    func createHero(name: String, description: String, power: String) {
        let newHero = CustomHeroEntity(context: context)
        newHero.id = UUID()
        newHero.name = name
        newHero.descriptionText = description
        newHero.power = power

        saveContext()
    }

    // Obtener todos los héroes personalizados
    func fetchHeroes() -> [CustomHeroEntity] {
        let request: NSFetchRequest<CustomHeroEntity> = CustomHeroEntity.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error obteniendo héroes personalizados: \(error)")
            return []
        }
    }

    // Actualizar un héroe existente
    func updateHero(hero: CustomHeroEntity, name: String, description: String, power: String) {
        hero.name = name
        hero.descriptionText = description
        hero.power = power

        saveContext()
    }

    // Eliminar un héroe
    func deleteHero(hero: CustomHeroEntity) {
        context.delete(hero)
        saveContext()
    }

    // Guardar cambios
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error al guardar el contexto: \(error)")
        }
    }
}
