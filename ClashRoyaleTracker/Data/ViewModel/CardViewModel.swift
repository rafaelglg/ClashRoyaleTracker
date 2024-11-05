//
//  CardViewModel.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import Foundation
import Combine

@Observable
final class CardViewModel {
    
    var cards: [CardInfoResponse] = []
    var filteredCards: [CardInfoResponse] = []
    
    let networkManager: any NetworkManagerProtocol
    var cancellables = Set<AnyCancellable>()
    
    var searchText = CurrentValueSubject<String, Never>("")
    var showAlert: Bool = false
    var alertMessage: String = ""
    var isLoading: Bool = false
    
    var isSearching: Bool {
        return !searchText.value.isEmpty
    }
    
    init(networkService: any NetworkManagerProtocol = NetworkManager.instance) {
        self.networkManager = networkService
    }
    
    func addSubscriber() {
        searchText
            .sink { [weak self] searchedName in
                self?.filteredCards(searchedCard: searchedName)
            }
            .store(in: &cancellables)
    }
    
    func filteredCards(searchedCard: String) {
        guard !searchedCard.isEmpty else {
            return filteredCards = []
        }
        
        let search = searchedCard.lowercased()
        filteredCards = cards.filter { cards in
            
            let cardContainsText = cards.name.filter {$0.isLetter}.localizedStandardContains(search)
            let rarityContainsText = cards.rarity.lowercased().localizedStandardContains(search)
            let levelContainsText = cards.maxLevel.description.contains(search)
            
            return cardContainsText || rarityContainsText || levelContainsText
        }
    }
    
    func getPlayersCard() {
        isLoading = true
        do {
            try networkManager.fetchCardInfo()
                .eraseToAnyPublisher()
                .map(\.items)
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
                } receiveValue: { [weak self] response in
                    self?.cards = response
                }
                .store(in: &cancellables)
        } catch {
            isLoading = false
        }
    }
}
