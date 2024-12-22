//
//  Hero.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation


// Modelo básico del héroe
struct Hero: Codable, Identifiable {
    let id: Int
    let nombre: String
    let primeraAparicion: String
    let imagen: String

    enum CodingKeys: String, CodingKey {
        case id
        case nombre
        case primeraAparicion = "primeraAparicion"
        case imagen
    }
    
    init(id: Int, nombre: String, primeraAparicion: String, imagen: String) {
        guard !nombre.isEmpty, !primeraAparicion.isEmpty, !imagen.isEmpty else {
            fatalError("Los valores no pueden estar vacíos.")
        }
        self.id = id
        self.nombre = nombre
        self.primeraAparicion = primeraAparicion
        self.imagen = imagen
    }
}

// Modelo detallado para los detalles del héroe
struct HeroDetail: Identifiable, Codable {
    let id: Int
    let nombre: String
    let nombreReal: String
    let alias: [String]
    let poderes: [String]
    let primeraAparicion: String
    let historia: String
    let afiliaciones: [String]
    let imagen: String
}
