//
//  HeroListViewModel.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation

class HeroListViewModel: ObservableObject {
    @Published var heroes: [Hero] = []          // Lista de héroes
    @Published var isLoading: Bool = false     // Indicador de carga
    @Published var errorMessage: String?       // Mensaje de error

    private let apiService = APIService()      // Servicio para consumir la API

    func fetchHeroes() {
        isLoading = true
        errorMessage = nil
        print("Iniciando la petición a la API...")

        apiService.fetchHeroes { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let heroes):
                    print("Se recibieron \(heroes.count) héroes.")
                    self?.heroes = heroes
                case .failure(let error):
                    print("Error al obtener héroes: \(error.localizedDescription)")
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
