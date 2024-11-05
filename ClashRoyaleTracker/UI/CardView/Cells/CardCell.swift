//
//  CardCell.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import SwiftUI

struct CardCell: View {
    let cards: CardInfoResponse
    
    var body: some View {
        LazyHStack {
            profileImage
            infoProfile
        }
        .frame(height: 100)
    }
    
    var profileImage: some View {
        AsyncImage(url: cards.iconUrls.medium) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
        } placeholder: {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 70)
                .redacted(reason: .placeholder)
        }
        .scaledToFit()
        .clipShape(.rect(cornerRadius: 10))
    }
    
    var infoProfile: some View {
        VStack(alignment: .leading) {
            Text(cards.name)
                .font(.headline)
            
            HStack(spacing: 4) {
                Text("Max level:")
                Text(cards.maxLevel.description)
            }
            Text(cards.rarity)
        }
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CardCell(cards: .preview)
    CardCell(cards: .preview)
        .padding()
}
