//
//  CardsDetailView.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import SwiftUI

struct CardsDetailView: View {
    @State var cards: CardInfoResponse
    
    var body: some View {
        List {
            
            cardImage
            cardInfo
        }
        .clipped()
    }
    
    var cardImage: some View {
        TabView {
            AsyncImage(url: cards.iconUrls.medium) { cardImage in
                cardImage.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .shadow(radius: 10)
            } placeholder: {
                ProgressView()
            }
            
            if let evolutionImage = cards.iconUrls.evolutionMedium {
                AsyncImage(url: evolutionImage) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(height: 400) // Altura del carrusel
    }
    
    var cardInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(cards.name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                HStack {
                    Image(systemName: "drop.fill")
                        .foregroundStyle(.purple)
                    if let elixirCost = cards.elixirCost {
                        Text("Elixir cost: \(elixirCost)")
                            .font(.subheadline)
                    }
                }
                
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundStyle(.red)
                    if let maxLevel = cards.maxEvolutionLevel {
                        Text("Max evolution level: \(maxLevel)")
                            .font(.subheadline)
                    }
                }
            }
            Spacer()
            VStack {
                Text(cards.rarity.capitalized)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Text("Max level: \(cards.maxLevel)")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    CardsDetailView(cards: .preview)
}
