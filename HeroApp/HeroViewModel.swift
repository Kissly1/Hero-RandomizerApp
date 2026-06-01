//
//  HeroViewModel.swift
//  HeroApp
//
//  Created by Alexandr Kisslitsyn on 07.03.2026.
//

import Foundation
import Combine

@MainActor
class HeroViewModel: ObservableObject {
    @Published var hero: Hero?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = HeroService()
    
    func loadRandomHero() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let fetchedHero = try await service.fetchRandomHero()
            hero = fetchedHero
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
