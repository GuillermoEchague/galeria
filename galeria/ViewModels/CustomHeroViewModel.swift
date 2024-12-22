//
//  CustomHeroViewModel.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation

import CoreData

class CustomHeroViewModel: ObservableObject {
    @Published var heroes: [CustomHeroEntity] = []    // Lista de héroes personalizados

    private let service = CustomHeroService()   // Servicio para interactuar con Core Data

    // Obtener héroes personalizados
    func fetchHeroes() {
        heroes = service.fetchHeroes()
    }

    // Agregar un nuevo héroe
    func addHero(name: String, description: String, power: String) {
        service.createHero(name: name, description: description, power: power)
        fetchHeroes()
    }

    // Actualizar un héroe existente
    func updateHero(hero: CustomHeroEntity, name: String, description: String, power: String) {
        service.updateHero(hero: hero, name: name, description: description, power: power)
        fetchHeroes()
    }

    // Eliminar un héroe
    func deleteHero(hero: CustomHeroEntity) {
        service.deleteHero(hero: hero)
        fetchHeroes()
    }
}
