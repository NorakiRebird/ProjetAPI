//
//  HarryPotterAPIModel.swift
//  ProjetAPI
//
//  Créé par Rayann chaghla le 17/07/2025.
//

import Foundation
import Observation

// Exemple de modèle pour récupérer les personnages Harry Potter via une API publique
// (par exemple https://hp-api.onrender.com/api/characters)
@Observable
final class HarryPotterAPIModel {
    var characters: [Character] = []
    var isLoading: Bool = false
    var errorMessage: String?

    // Structure de personnage simplifiée
    struct Character: Codable, Identifiable {
        let id = UUID()
        let name: String
        let house: String?
        let image: String?
        
        enum CodingKeys: String, CodingKey {
            case name, house, image
        }
    }

    // Récupère la liste des personnages
    @MainActor
    func fetchCharacters() async {
        isLoading = true
        errorMessage = nil
        let urlString = "https://hp-api.onrender.com/api/characters"
        guard let url = URL(string: urlString) else {
            errorMessage = "URL invalide"
            isLoading = false
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Character].self, from: data)
            characters = decoded
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
