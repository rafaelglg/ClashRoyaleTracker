//
//  UpcomingChestModel.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 31/10/24.
//

import Foundation

struct UpcomingChestModel: Codable, Identifiable, Hashable {
    var id = UUID()
    let items: [UpcomingChestResponse]
    
    enum CodingKeys: CodingKey {
        case items
    }
}
 
struct UpcomingChestResponse: Codable, Hashable {
    let index: Int
    let name: String
}
