//
//  NetworkManager.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 23/10/24.
//

import Foundation
import Combine

protocol NetworkManagerProtocol: AnyObject {
    associatedtype FetchCardInfoReturnType: Publisher<CardModel, Error>
    func fetchCardInfo() throws -> FetchCardInfoReturnType
    
    associatedtype PublisherReturn: Publisher<(PlayerModel, UpcomingChestModel), Error>
    func fetchPlayerInfo(playerID: String) throws -> PublisherReturn
}

@Observable
final class NetworkManager: NetworkManagerProtocol {
    
    nonisolated(unsafe) static let instance = NetworkManager()
    private init () {}
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let res = output.response as? HTTPURLResponse, res.statusCode >= 200 && res.statusCode < 300 else {
            throw ErrorManager.badServerResponse
        }
        return output.data
    }
    
    func handleURL(url: String) throws -> URLRequest {
        guard let url = URL(string: url) else {
            throw ErrorManager.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(ApiKey.clashRoyaleApi)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    func fetchCardInfo() throws -> some Publisher<CardModel, Error> {
        
        let request = try handleURL(url: Constants.cardsURL)
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: CardModel.self, decoder: Utils.jsonDecoder)
    }
    
    func fetchPlayerInfo(playerID: String) throws -> some Publisher<(PlayerModel, UpcomingChestModel), Error> {
        
        guard let playerIdUrlEconded = playerID.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) else {
            throw ErrorManager.urlBadEncodedPercentage
        }
        
        let playerURL = try handleURL(url: Constants.playersURL + playerIdUrlEconded.uppercased())
        let upcomingURL = try handleURL(url: Utils.upcomingChestsURL(for: playerIdUrlEconded.uppercased()))
        
        let playerPublisher = URLSession.shared
            .dataTaskPublisher(for: playerURL)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: PlayerModel.self, decoder: Utils.jsonDecoder)
        
        let chestPublisher = URLSession.shared
            .dataTaskPublisher(for: upcomingURL)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .tryCompactMap(handleOutput)
            .decode(type: UpcomingChestModel.self, decoder: Utils.jsonDecoder)
        
        return playerPublisher
            .zip(chestPublisher)
            .eraseToAnyPublisher()
    }
}
