//
//  PlayerInfoRowCell.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 31/10/24.
//

import SwiftUI

struct PlayerInfoRowCell: View {
    
    let name: String
    let iconName: String
    let color: Color
    
    var body: some View {
        Label {
            Text(name)
                .font(.body)
        } icon: {
            Image(systemName: iconName)
                .foregroundStyle(color)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PlayerInfoRowCell(name: "esto es una prueba larga", iconName: "applelogo", color: .silver)
        .padding()
}
