//
//  HeroService.swift
//  HeroApp
//
//  Created by Alexandr Kisslitsyn on 07.03.2026.
//

import Foundation

class HeroService {
    private let baseURL = "https://akabab.github.io/superhero-api/api"
    
    func fetchRandomHero() async throws -> Hero {
        let randomId = Int.random(in: 1...731)
        let urlString = "\(baseURL)/id/\(randomId).json"
        
        guard let url = URL(string: urlString) else {
            throw HeroError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw HeroError.networkError
        }
        
        let decoder = JSONDecoder()
        let hero = try decoder.decode(Hero.self, from: data)
        return hero
    }
}

enum HeroError: Error, LocalizedError {
    case invalidURL
    case networkError
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .networkError:
            return "Network request failed"
        case .decodingError:
            return "Failed to decode hero data"
        }
    }
}
