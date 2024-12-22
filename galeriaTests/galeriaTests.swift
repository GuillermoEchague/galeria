//
//  galeriaTests.swift
//  galeriaTests
//
//  Created by Guillermo Echague on 22-12-24.
//

import XCTest

@testable import galeria

final class hero: XCTestCase {

    let sampleHero = Hero(
            id: 1,
            nombre: "Iron Man",
            primeraAparicion: "Tales of Suspense #39",
            imagen: "ironman.jpg"
        )
        
        func testHeroInitialization() {
            XCTAssertEqual(sampleHero.id, 1)
            XCTAssertEqual(sampleHero.nombre, "Iron Man")
            XCTAssertEqual(sampleHero.primeraAparicion, "Tales of Suspense #39")
            XCTAssertEqual(sampleHero.imagen, "ironman.jpg")
        }
        
        func testHeroEncoding() throws {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(sampleHero)
            
            let decodedDictionary = try JSONSerialization.jsonObject(with: encodedData) as! [String: Any]
            XCTAssertEqual(decodedDictionary["id"] as? Int, 1)
            XCTAssertEqual(decodedDictionary["nombre"] as? String, "Iron Man")
            XCTAssertEqual(decodedDictionary["primeraAparicion"] as? String, "Tales of Suspense #39")
            XCTAssertEqual(decodedDictionary["imagen"] as? String, "ironman.jpg")
        }
        
        func testHeroDecoding() throws {
            let jsonString = """
            {
                "id": 1,
                "nombre": "Iron Man",
                "primeraAparicion": "Tales of Suspense #39",
                "imagen": "ironman.jpg"
            }
            """
            
            let jsonData = jsonString.data(using: .utf8)!
            let decoder = JSONDecoder()
            let decodedHero = try decoder.decode(Hero.self, from: jsonData)
            
            XCTAssertEqual(decodedHero.id, sampleHero.id)
            XCTAssertEqual(decodedHero.nombre, sampleHero.nombre)
            XCTAssertEqual(decodedHero.primeraAparicion, sampleHero.primeraAparicion)
            XCTAssertEqual(decodedHero.imagen, sampleHero.imagen)
        }
        
        func testInvalidJSON() {
            let invalidJSON = """
            {
                "id": "invalid",
                "nombre": 123,
                "primeraAparicion": true,
                "imagen": null
            }
            """
            
            let jsonData = invalidJSON.data(using: .utf8)!
            let decoder = JSONDecoder()
            
            XCTAssertThrowsError(try decoder.decode(Hero.self, from: jsonData))
        }
        
        func testMissingProperties() {
            let incompleteJSON = """
            {
                "id": 1,
                "nombre": "Iron Man"
            }
            """
            
            let jsonData = incompleteJSON.data(using: .utf8)!
            let decoder = JSONDecoder()
            
            XCTAssertThrowsError(try decoder.decode(Hero.self, from: jsonData))
        }
        
        func testCodingKeysMapping() throws {
            XCTAssertEqual(Hero.CodingKeys.id.rawValue, "id")
            XCTAssertEqual(Hero.CodingKeys.nombre.rawValue, "nombre")
            XCTAssertEqual(Hero.CodingKeys.primeraAparicion.rawValue, "primeraAparicion")
            XCTAssertEqual(Hero.CodingKeys.imagen.rawValue, "imagen")
        }
    }

   
        
    
