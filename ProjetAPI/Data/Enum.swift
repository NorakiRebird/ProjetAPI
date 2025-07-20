//
//  Enum.swift
//  ProjetAPI
//
//  Created by Rayann chaghla on 18/07/2025.
//

import Foundation

enum School: String, CaseIterable {
    case gryffindor
    case hufflepuff
    case ravenclaw
    case slytherin
    
    
    var emblem: String {
        switch self {
        case .gryffindor: return "gryffindor"
        case .hufflepuff: return "hufflepuff"
        case .ravenclaw: return "ravenclaw"
        case .slytherin: return "slytherin"
        }
    }
}


extension HarryPotterAPIModel.Character {
    var school: School? {
        guard let house = house?.lowercased() else { return nil }
        return School(rawValue: house)
    }
}
