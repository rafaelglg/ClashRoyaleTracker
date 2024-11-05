//
//  CardModel.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 23/10/24.
//

import Foundation

struct CardModel: Codable, Hashable {
    let items: [CardInfoResponse]
}

struct CardInfoResponse: Codable, Identifiable, Hashable {
    let name: String
    let id, maxLevel: Int
    let elixirCost: Int?
    let maxEvolutionLevel: Int?
    let iconUrls: IconUrls
    let rarity: String
    
    struct IconUrls: Codable, Hashable {
        let medium: URL
        let evolutionMedium: URL?
    }
}
