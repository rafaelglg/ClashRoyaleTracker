//
//  PlayerModel.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import Foundation

struct PlayerModel: Codable, Hashable, Identifiable {
    var id = UUID()
    let tag: String
    let name: String
    let expLevel: Int
    let trophies: Int
    let bestTrophies: Int
    let wins: Int
    let losses: Int
    let battleCount: Int
    let threeCrownWins: Int
    let challengeCardsWon: Int
    let challengeMaxWins: Int
    let tournamentCardsWon: Int
    let tournamentBattleCount: Int
    let donations: Int
    let donationsReceived: Int
    let totalDonations: Int
    let warDayWins: Int
    let clanCardsCollected: Int
    let arena: ArenaModel
    let badges: [Badges]
    let currentFavouriteCard: CurrentFavouriteCard
    
    enum CodingKeys: String, CodingKey {
        case tag, name, expLevel, trophies, bestTrophies, wins, losses
        case battleCount, threeCrownWins, challengeCardsWon, challengeMaxWins
        case tournamentCardsWon, tournamentBattleCount, donations, donationsReceived
        case totalDonations, warDayWins, clanCardsCollected, arena, badges, currentFavouriteCard
    }
}

struct ArenaModel: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}

struct LeagueStatistics: Codable {
    let currentSeason: CurrentSeason
    let previousSeason: PreviousSeason
    let bestSeason: BestSeason
    
    struct CurrentSeason: Codable {
        let trophies: Int
    }
    
    struct PreviousSeason: Codable, Identifiable, Hashable {
        let id: String
        let bestTrophies: Int
        let trophies: Int
    }
    
    struct BestSeason: Codable, Identifiable, Hashable {
        let id: String
        let rank: Int
        let trophies: Int
    }
}

struct Badges: Codable, Hashable {
    let name: String
    let level: Int
    let maxLevel: Int
    let progress: Int
    let target: Int?
    let iconUrls: IconUrlsPlayerModel
}

struct IconUrlsPlayerModel: Codable, Hashable {
    let large: URL
}

struct CurrentFavouriteCard: Codable, Identifiable, Hashable {
    let name: String
    let id: Int
    let maxLevel: Int
    let elixirCost: Int
    let iconUrls: IconUrls
    let rarity: String
    
    struct IconUrls: Codable, Hashable {
        let medium: URL
    }
}
/*
"currentFavouriteCard": {
   "name": "Bowler",
   "id": 26000034,
   "maxLevel": 9,
   "elixirCost": 5,
   "iconUrls": {
     "medium": "https://api-assets.clashroyale.com/cards/300/SU4qFXmbQXWjvASxVI6z9IJuTYolx4A0MKK90sTIE88.png"
   },
   "rarity": "epic"
 },
 "st

"leagueStatistics": {
    "currentSeason": {
      "trophies": 7522
    },
    "previousSeason": {
      "id": "2024-09",
      "trophies": 5353,
      "bestTrophies": 5371
    },
    "bestSeason": {
      "id": "2016-05",
      "rank": 67712,
      "trophies": 3072
    }
  },
  "badges": [
    {
      "name": "YearsPlayed",
      "level": 8,
      "maxLevel": 9,
      "progress": 3215,
      "target": 3285,
      "iconUrls": {
        "large": "https://api-assets.clashroyale.com/playerbadges/512/T9iTL2NzRUCMK5KoV3p9to5vxhUUvsooT-DMxwIvSCg.png"
      }
    },
    {
      "name": "BattleWins",
      "level": 6,
      "maxLevel": 8,
      "progress": 4181,
      "target": 5000,
      "iconUrls": {
        "large": "https://api-assets.clashroyale.com/playerbadges/512/Hh18NG8LhvwZrcmtGR8rSKRezmhOxCilxqhroDLBnys.png"
      }
    },
    {
      "name": "ClanWarsVeteran",
      "level": 2,
      "maxLevel": 3,
      "progress": 34,
      "target": 100,
      "iconUrls": {
        "large": "https://api-assets.clashroyale.com/playerbadges/512/rIYzDp4Yxy8tyEJBOuMRCudNERR03VUHvdJRcvi5Hnc.png"
      }
    },
    {
 */
