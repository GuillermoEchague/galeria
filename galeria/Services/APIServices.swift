//
//  APIServices.swift
//  galeria
//
//  Created by Guillermo Echague on 22-12-24.
//

import Foundation


class APIService {
    func fetchHeroes(completion: @escaping (Result<[Hero], Error>) -> Void) {
        guard let url = URL(string: "https://heroes-api-two.vercel.app/es/marvel/heroes") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }

            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                completion(.success(heroes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchHeroDetails(id: Int, completion: @escaping (Result<HeroDetail, Error>) -> Void) {
        guard let url = URL(string: "https://heroes-api-two.vercel.app/es/marvel/heroes/\(id)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }

            do {
                let heroDetail = try JSONDecoder().decode(HeroDetail.self, from: data)
                completion(.success(heroDetail))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
