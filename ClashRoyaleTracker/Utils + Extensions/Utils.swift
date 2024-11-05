//
//  Utils.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 23/10/24.
//

import Foundation

struct Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    static func upcomingChestsURL(for playerID: String) -> String {
        return "https://proxy.royaleapi.dev/v1/players/\(playerID)/upcomingchests"
    }
}
