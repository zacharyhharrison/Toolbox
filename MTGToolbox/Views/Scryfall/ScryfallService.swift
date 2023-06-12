//
//  ScryfallService.swift
//  MTGToolbox
//
//  Created by Zachary Harrison on 6/11/23.
//

import Foundation

class ScryfallService {
    func getRandomCard(completion: @escaping (Result<Card, Error>) -> Void) {
        guard let url = URL(string: "https://api.scryfall.com/cards/random?q=is%3Acommander") else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let card = try JSONDecoder().decode(Card.self, from: data)
                    completion(.success(card))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
