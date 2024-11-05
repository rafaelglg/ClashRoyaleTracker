//
//  EmptySearchView.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 26/10/24.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        VStack {
            Text("You can search by the **name**, **rarity** or **level** of the card")
                .font(.title3)
                .padding(30)
                .lineLimit(2)
        }
        .padding()
    }
}

#Preview {
    EmptySearchView()
}
