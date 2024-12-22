//
//  HeroDetailViewModel.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation

class HeroDetailViewModel: ObservableObject {
    @Published var heroDetail: HeroDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService = APIService()

    func fetchHeroDetail(id: Int) {
        isLoading = true
        errorMessage = nil

        apiService.fetchHeroDetails(id: id) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let heroDetail):
                    self?.heroDetail = heroDetail
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

