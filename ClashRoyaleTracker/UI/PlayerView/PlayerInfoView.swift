//
//  PlayerInfoView.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 28/10/24.
//

import SwiftUI

struct PlayerInfoView: View {
    @Environment(\.dismiss) private var dismiss
    let player: PlayerModel
    let upcomingChest: UpcomingChestModel
    @State private var isExpandedSection: Bool = false
    
    var body: some View {
        NavigationStack {
            
            List {
                
                // Player profile section
                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text(player.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                            Spacer()
                            Text("Level \(player.expLevel)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Label {
                            Text("\(player.trophies) Trophies")
                                .font(.body)
                                .fontWeight(.semibold)
                        } icon: {
                            Image(systemName: "crown.fill") // Represents trophies
                                .foregroundStyle(.yellow)
                        }
                        
                    }
                    .padding(.vertical, 5)
                }
                
                // Player statistics section
                Section {
                    PlayerInfoRowCell(
                        name: "Wins: \(player.wins)",
                        iconName: "star.fill",
                        color: .yellow)
                    
                    PlayerInfoRowCell(
                        name: "Battles in total: \(player.battleCount)",
                        iconName: "medal.star",
                        color: .blue)
                    
                    PlayerInfoRowCell(
                        name: "Losses: \(player.losses)",
                        iconName: "xmark.circle",
                        color: .red)
                    
                    PlayerInfoRowCell(
                        name: "Three Crown Wins: \(player.threeCrownWins)",
                        iconName: "flame",
                        color: .orange)
                } header: {
                    Text("Player Statistics")
                        .foregroundStyle(.blue)
                }
                
                // Upcoming chest section
                Section(isExpanded: $isExpandedSection) {
                    
                    ForEach(upcomingChest.items, id: \.index) { chests in
                        HStack {
                            Text(chests.index.description)
                            Text(chests.name)
                        }
                    }

                } header: {
                    HStack {
                        Text("Upcoming chests")
                            .foregroundStyle(.blue)
                        Spacer()
                        Button {
                            withAnimation(.default) {
                                isExpandedSection.toggle()
                            }
                        } label: {
                            Image(systemName: isExpandedSection ? "chevron.up" : "chevron.down")
                        }
                    }
                }
                
                // Clan statistics section
                Section {
                    PlayerInfoRowCell(
                        name: "Donations: \(player.donations)",
                        iconName: "person.3.fill",
                        color: .green)
                    
                    PlayerInfoRowCell(
                        name: "Donations Received: \(player.donationsReceived)",
                        iconName: "gift.fill",
                        color: .purple)
                    
                    PlayerInfoRowCell(
                        name: "War Day Wins: \(player.warDayWins)",
                        iconName: "crown",
                        color: .yellow)
                } header: {
                    Text("Clan Statistics")
                        .foregroundStyle(.blue)
                }
                
                // Arena statistics section
                Section {
                    PlayerInfoRowCell(
                        name: "Current arena: \(player.arena.name)",
                        iconName: "bell.fill",
                        color: .teal)
                } header: {
                    Text("Arena")
                        .foregroundStyle(.blue)
                }
                
                // Favorite card section
                Section {
                    HStack(alignment: .center) {
                                                
                        AsyncImage(url: player.currentFavouriteCard.iconUrls.medium) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text(player.currentFavouriteCard.name)
                                .fontWeight(.semibold)
                            
                            Text("Elixir cost: \(player.currentFavouriteCard.elixirCost)")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        Text(player.currentFavouriteCard.rarity)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 10)
                    
                } header: {
                    Text("Current Favorite Card")
                        .foregroundStyle(.blue)
                } footer: {
                    Text("This card may change")
                }
                
            }
            .navigationTitle(player.tag)
            .toolbar {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    PlayerInfoView(player: .preview, upcomingChest: UpcomingChestModel(items: [UpcomingChestResponse(index: 2, name: "hola")]))
}
