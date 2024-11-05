//
//  CardsView.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 23/10/24.
//

import SwiftUI

struct CardsView: View {
    
    @State var cardsVM = CardViewModel()
    @State private var showHelpSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            
            CardListChildView(cardsVM: cardsVM)
            
                .overlay {
                    if cardsVM.filteredCards.isEmpty && cardsVM.isSearching {
                        ContentUnavailableView("No cards found", systemImage: "magnifyingglass.circle.fill", description: Text("There were no result for ''\(cardsVM.searchText.value)''. \n Try a new search."))
                    }
                }
                .navigationDestination(for: CardInfoResponse.self) { player in
                    CardsDetailView(cards: player)
                        .navigationTitle(player.name)
                        .navigationBarTitleDisplayMode(.inline)
                }
                .searchable(text: $cardsVM.searchText.value, prompt: "Search by name, rarity or level")
                .navigationTitle("Cards")
                .onAppear {
                    cardsVM.getPlayersCard()
                    cardsVM.addSubscriber()
                }
            
                .alert("Application error", isPresented: $cardsVM.showAlert) {
                    Button("Try again") {}
                } message: {
                    Text(cardsVM.alertMessage)
                }
                .toolbar {
                    Button("Help") {
                        showHelpSheet.toggle()
                    }
                }
                .sheet(isPresented: $showHelpSheet) {
                    HelpView()
                        .presentationBackground(.ultraThinMaterial)
                }
            
        }
    }
}

#Preview {
    CardsView()
}

struct CardListChildView: View {
    @Bindable var cardsVM: CardViewModel
    @Environment(\.isSearching) private var isSearching
    @State private var startPoint: UnitPoint = .init(x: -1, y: 0.5)
    @State private var endPoint: UnitPoint = .init(x: 0, y: 0.5)
    
    var body: some View {
        VStack {
            
            if isSearching && cardsVM.searchText.value.isEmpty {
                EmptySearchView()
            } else {
                
                if cardsVM.isLoading {
                    List(CardInfoResponse.dummyData) { player in
                        CardCell(cards: player)
                            .redacted(reason: .placeholder)
                            .foregroundStyle(
                                .linearGradient(
                                    colors: [Color(.silver),
                                             Color(.lightGray)],
                                    startPoint: startPoint,
                                    endPoint: endPoint))
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
                                    startPoint = .init(x: 1.5, y: 0.5)
                                    endPoint = .init(x: 2.5, y: 0.5)
                                }
                            }
                    }
                } else {
                    
                    List(isSearching ? cardsVM.filteredCards : cardsVM.cards) { player in
                        NavigationLink(value: player) {
                            CardCell(cards: player)
                        }
                    }
                }
            }
        }
    }
}
