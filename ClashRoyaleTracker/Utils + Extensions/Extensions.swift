//
//  Extensions.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import Foundation

extension CardInfoResponse {
    
    static let preview = CardInfoResponse(name: "Knight", id: 1, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: "Epic")
    
    static let dummyData: [CardInfoResponse] = [
        CardInfoResponse(name: "Knight", id: 1, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 2, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 3, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 4, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 5, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 6, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 7, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: ""),
        CardInfoResponse(name: "Knight", id: 8, maxLevel: 14, elixirCost: 3, maxEvolutionLevel: 1, iconUrls: iconUrls, rarity: "")
    ]
    
    static let iconUrls = IconUrls(medium: URL(string: "https://api-assets.clashroyale.com/cards/300/jAj1Q5rclXxU9kVImGqSJxa4wEMfEhvwNQ_4jiGUuqg.png")!, evolutionMedium: URL(string: "https://api-assets.clashroyale.com/cardevolutions/300/jAj1Q5rclXxU9kVImGqSJxa4wEMfEhvwNQ_4jiGUuqg.png"))
}

extension PlayerModel {
    // swiftlint:disable:next line_length
    static let preview = PlayerModel(tag: "#9JU08Y", name: "Rafael", expLevel: 43, trophies: 7522, bestTrophies: 7522, wins: 4188, losses: 3428, battleCount: 7616, threeCrownWins: 1401, challengeCardsWon: 4360, challengeMaxWins: 12, tournamentCardsWon: 190, tournamentBattleCount: 365, donations: 0, donationsReceived: 0, totalDonations: 31490, warDayWins: 34, clanCardsCollected: 46146, arena: arenaModel, badges: [badges], currentFavouriteCard: currentFavoriteCard)
    
    static let arenaModel = ArenaModel(id: 54000017, name: "Boot camp")
    static let currentFavoriteCard = CurrentFavouriteCard(name: "Bowler", id: 25, maxLevel: 9, elixirCost: 5, iconUrls: iconURL, rarity: "Epic")
    
    static let iconURL = CurrentFavouriteCard.IconUrls(medium: URL(string: "https://api-assets.clashroyale.com/cards/300/SU4qFXmbQXWjvASxVI6z9IJuTYolx4A0MKK90sTIE88.png")!)
    static let badges = Badges(name: "years", level: 8, maxLevel: 9, progress: 3219, target: 3285, iconUrls: iconUrls)
    static let iconUrls = IconUrlsPlayerModel(large: URL(string: "https://api-assets.clashroyale.com/playerbadges/512/T9iTL2NzRUCMK5KoV3p9to5vxhUUvsooT-DMxwIvSCg.png")!)
    
    static let dummyData = [
        // swiftlint:disable:next line_length
        PlayerModel(tag: "#9JU08Y", name: "Rafael", expLevel: 43, trophies: 7522, bestTrophies: 7522, wins: 4188, losses: 3428, battleCount: 7616, threeCrownWins: 1401, challengeCardsWon: 4360, challengeMaxWins: 12, tournamentCardsWon: 190, tournamentBattleCount: 365, donations: 0, donationsReceived: 0, totalDonations: 31490, warDayWins: 34, clanCardsCollected: 46146, arena: arenaModel, badges: [badges], currentFavouriteCard: currentFavoriteCard),
        // swiftlint:disable:next line_length
        PlayerModel(tag: "#9JU08Y", name: "Rafael", expLevel: 43, trophies: 7522, bestTrophies: 7522, wins: 4188, losses: 3428, battleCount: 7616, threeCrownWins: 1401, challengeCardsWon: 4360, challengeMaxWins: 12, tournamentCardsWon: 190, tournamentBattleCount: 365, donations: 0, donationsReceived: 0, totalDonations: 31490, warDayWins: 34, clanCardsCollected: 46146, arena: arenaModel, badges: [badges], currentFavouriteCard: currentFavoriteCard)
    ]
}
