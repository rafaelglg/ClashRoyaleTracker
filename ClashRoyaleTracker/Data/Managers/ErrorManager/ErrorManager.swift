//
//  ErrorManager.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import Foundation

enum ErrorManager: Error, LocalizedError {
    case badServerResponse
    case badURL
    case badJsonModelDecoded
    case urlBadEncodedPercentage
    
    var errorDescription: String? {
        switch self {
        case .badServerResponse:
            return "No player ID found, please check your spelling"
        case .badURL:
            return "The url path is incorrect."
        case .badJsonModelDecoded:
            return "The Model has been bad decoded, problem with the model"
        case .urlBadEncodedPercentage:
            return "The url is bad encoded with the percentage should be %23..."
        }
    }
}
