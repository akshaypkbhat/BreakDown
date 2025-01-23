//
//  AddPlayerView.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import SwiftUI

struct AddPlayerView: View {
    @Binding var players: [Player]
    @State private var playerName = ""
    @State private var selectedPosition: Position = .offense

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Player Info")) {
                    TextField("Player Name", text: $playerName)
                    
                    Picker("Position", selection: $selectedPosition) {
                        ForEach(Position.allCases, id: \.self) { position in
                            Text(position.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Button("Add Player") {
                    let newPlayer = Player(name: playerName, position: selectedPosition)
                    players.append(newPlayer)
                    playerName = "" // Reset the name field
                }
            }
            .navigationTitle("Add Player")
        }
    }
}
