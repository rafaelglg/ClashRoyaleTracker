//
//  PlayerDetail.swift
//  ClashRoyaleTrackerApp
//
//  Created by Rafael Loggiodice on 25/10/24.
//

import SwiftUI

struct SearchPlayerView: View {
    
    @State var playerVM = PlayerViewModel()
    @FocusState private var isFocused: Bool
    @State private var showPlayerSheet: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Hide keyboard tapping on background only
                Color.background
                    .ignoresSafeArea()
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if isFocused {
                            isFocused = false
                        }
                    }
                
                VStack {
                    textfield
                    findPlayerIDHelp
                    searchButton
                }
                .alert("Invalid player ID", isPresented: $playerVM.showAlert, actions: {
                    Button("Try again") {}
                }, message: {
                    Text(playerVM.alertMessage)
                })
                
                .onAppear {
                    isFocused.toggle()
                }
                .navigationTitle("Search a player")
            }
        }
    }
    
    var textfield: some View {
        HStack {
            Image(systemName: "person.fill")
                .foregroundStyle(Color(.systemGray))
            
            VStack { // to have the divider bar down from textfield
                HStack { // inside text of texfield
                    
                    Text(verbatim: "#")
                        .foregroundStyle(Color(.systemGray))
                    
                    TextField(text: $playerVM.textfieldPlayerID) {
                        Text("Type your player id")
                    }
                    .focused($isFocused)
                    .autocorrectionDisabled()
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.characters)
                    .submitLabel(.search)
                    .onSubmit {
                        playerVM.getPlayerInfo(playerID: "#" + playerVM.textfieldPlayerID)
                    }
                }
                Divider()
                    .background(.primary)
                
            }
            .padding(.horizontal, 15)
        }
        .padding()
    }
    
    var findPlayerIDHelp: some View {
        Button {
            playerVM.showHelpSheet.toggle()
            isFocused = false
        } label: {
            Text("how to find player ID?")
                .foregroundStyle(Color(.label))
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 200, height: 35)
        }
        .controlSize(.small)
        .buttonBorderShape(.capsule)
        .buttonStyle(.bordered)
        
        .padding(.vertical, 18)
        
        .sheet(isPresented: $playerVM.showHelpSheet) {
            HelpPlayerID()
                .interactiveDismissDisabled()
        }
        
    }
    
    var searchButton: some View {
        Button {
            playerVM.getPlayerInfo(playerID: "#" + playerVM.textfieldPlayerID)
        } label: {
            if playerVM.isLoading {
                ProgressView()
                    .tint(.white)
                    .controlSize(.regular)
                    .foregroundStyle(.white)
                    .frame(width: 230, height: 30)
            } else {
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                        .fontWeight(.semibold)
                }
                .frame(width: 230, height: 30)
            }
        }
        .sheet(item: $playerVM.player) { playerModel in
            PlayerInfoView(player: playerModel, upcomingChest: playerVM.upcomingChest!)
            
        }
        .controlSize(.large)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
    }
}

#Preview {
    SearchPlayerView()
}
