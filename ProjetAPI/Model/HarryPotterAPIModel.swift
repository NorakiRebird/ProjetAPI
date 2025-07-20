//
//  HarryPotterAPIModel.swift
//  ProjetAPI
//
//  Créé par Rayann chaghla le 17/07/2025.
//

import Foundation
import Observation



@Observable
 class HarryPotterAPIModel {
    var characters: [Character] = []
    var isLoading: Bool = false
    var errorMessage: String?

    
    struct Character: Codable, Identifiable {
        let id: String
        let name: String
        let alternateNames: [String]?
        let species: String?
        let gender: String?
        let house: String?
        let dateOfBirth: String?
        let yearOfBirth: Int?
        let wizard: Bool?
        let ancestry: String?
        let eyeColour: String?
        let hairColour: String?
        let image: String?
        let wand: Wand?

        struct Wand: Codable {
            let wood: String?
            let core: String?
            let length: Double?
        }

        enum CodingKeys: String, CodingKey {
            case id
            case name
            case alternateNames 
            case species
            case gender
            case house
            case dateOfBirth
            case yearOfBirth
            case wizard
            case ancestry
            case eyeColour
            case hairColour
            case image
            case wand
        }
    }

    
    @MainActor
    func fetchCharacters() async {
        isLoading = true
        errorMessage = nil
        let urlString = "https://potterhead-api.vercel.app/api/characters"
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

