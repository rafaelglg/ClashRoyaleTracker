//
//  PlayerViewModel.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 25/10/24.
//

import Foundation
import Combine

@Observable
final class PlayerViewModel {
    let networkManager: any NetworkManagerProtocol
    var player: PlayerModel?
    var upcomingChest: UpcomingChestModel?
    var cancellable = Set<AnyCancellable>()
    
    var showAlert: Bool = false
    var alertMessage: String = ""
    var textfieldPlayerID: String = ""
    var showHelpSheet: Bool = false
    
    var isLoading: Bool = false
    
    init(networkManager: any NetworkManagerProtocol = NetworkManager.instance) {
        self.networkManager = networkManager
    }
    
    func getPlayerInfo(playerID: String) {
        isLoading = true
        do {
            try networkManager.fetchPlayerInfo(playerID: playerID)
                .eraseToAnyPublisher()
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        self?.isLoading = false
                    case .failure(let error):
                        self?.isLoading = false
                        self?.showAlert.toggle()
                        self?.alertMessage = error.localizedDescription
                    }
                } receiveValue: { [weak self] playerResponse in
                    self?.player = playerResponse.0
                    self?.upcomingChest = playerResponse.1
                }
                .store(in: &cancellable)
        } catch {
            self.isLoading = false
            self.alertMessage = error.localizedDescription
        }
    }
}
