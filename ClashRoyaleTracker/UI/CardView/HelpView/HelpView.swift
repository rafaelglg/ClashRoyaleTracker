//
//  HelpView.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 27/10/24.
//

import SwiftUI

struct HelpView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section("how to search?") {
                    Text("You can search using name, rarity or level of the card")
                }
                
                Section("Apple developer") {
                    Text("This app was developed by Rafael Loggiodice, using 100% **SwiftUI** and **Combine**.")
                        .font(.callout)
                }
            }
            .navigationTitle("Help")
            .toolbar {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    HelpView()
}
