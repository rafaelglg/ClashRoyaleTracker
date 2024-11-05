//
//  ClashTabView.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 24/10/24.
//

import SwiftUI

struct ClashTabView: View {
        
    var body: some View {
        TabView {
            
            Tab("Players", systemImage: "person.fill") {
                SearchPlayerView()
                    .tag(0)
            }
            
            Tab("Cards", systemImage: "gamecontroller.fill") {
                CardsView()
                    .tag(1)
            }
        }
    }
}

#Preview {
    ClashTabView()
}
