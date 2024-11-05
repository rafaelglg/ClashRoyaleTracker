//
//  HelpPlayerID.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 27/10/24.
//

import SwiftUI

struct HelpPlayerID: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var imageDashboardTapped: Bool = false
    @State private var imagePlayerIDTapped: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Text("You need to have downloaded the app ''Clash Royale'' in order to find your ID.")
                        .listRowInsets(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                    
                    Section {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Enter the app and inside tap in your name.")
                            
                            Image(.dashboardGameView)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .clipShape(.rect(cornerRadius: 20))
                                .scaleEffect(imageDashboardTapped ? 1.15 : 1)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        imageDashboardTapped.toggle()
                                    }
                                }
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                        }
                        .listRowInsets(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                    } header: {
                        Text("Step 1")
                            .font(.headline)
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Find your ID and tap, will be copy in your clipboard.")
                                .padding(.bottom, 15)
                            
                            Image(.playerID)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300)
                                .clipShape(.rect(cornerRadius: 20))
                                .scaleEffect(imagePlayerIDTapped ? 1.15 : 1)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        imagePlayerIDTapped.toggle()
                                    }
                                }
                        }
                        .listRowInsets(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                    } header: {
                        Text("Step 2")
                            .font(.headline)
                    }
                    
                    Section {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Come back and paste the code without ''#'' because its already written by default.")
                            
                        }
                        .listRowInsets(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                    } header: {
                        Text("Step 3")
                            .font(.headline)
                    }
                    
                    Section {
                        Text("For more info click in this link [Clash Royale Info](https://royaleapi.com/?lang=en)")
                            .listRowInsets(EdgeInsets(top: 30, leading: 30, bottom: 30, trailing: 30))
                    } footer: {
                        Text("The link will take you to Clash royal official web and more info will be displayed")
                    }
                }
            }
            .navigationTitle("How to find my ID?")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    HelpPlayerID()
}
