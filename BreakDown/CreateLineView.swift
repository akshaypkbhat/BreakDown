//
//  CreateLineView.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import SwiftUI

struct CreateLineView: View {
    @Binding var lines: [Line] // List of lines (passed in from parent view)
    @State private var lineName = ""
    @State private var starters: [Player] = [] // Array of 7 starters
    @State private var substitutes: [Player] = [] // Array of substitutes
    @State private var selectedPlayer: Player? = nil // The player to add to starters/subs
    @State private var players: [Player] = [] // Add existing players here
    
    var body: some View {
        Form {
            // Line name
            Section(header: Text("Line Name")) {
                TextField("Enter Line Name", text: $lineName)
            }

            // Add starters (7 players)
            Section(header: Text("Add Starters")) {
                ForEach(starters) { player in
                    Text(player.name)
                }

                // Player picker for starters
                Section(header: Text("Available Players for Starters")) {
                    Picker("Select Player", selection: $selectedPlayer) {
                        ForEach(players) { player in
                            Text(player.name).tag(player as Player?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Button("Add Starter") {
                    if starters.count < 7, let player = selectedPlayer {
                        starters.append(player) // Add selected player to starters
                    }
                }
            }

            // Add substitutes
            Section(header: Text("Add Substitutes")) {
                ForEach(substitutes) { player in
                    Text(player.name)
                }

                // Player picker for substitutes
                Section(header: Text("Available Players for Substitutes")) {
                    Picker("Select Player", selection: $selectedPlayer) {
                        ForEach(players) { player in
                            Text(player.name).tag(player as Player?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }

                Button("Add Substitute") {
                    if substitutes.count < 5, let player = selectedPlayer {
                        substitutes.append(player) // Add selected player to substitutes
                    }
                }
            }
            
            // Save the line
            Button("Save Line") {
                if !lineName.isEmpty && starters.count == 7 {
                    let newLine = Line(name: lineName, starters: starters, substitutes: substitutes)
                    lines.append(newLine) // Save the new line
                    clearForm()
                }
            }
        }
        .navigationTitle("Create Line")
    }

    private func clearForm() {
        lineName = ""
        starters.removeAll()
        substitutes.removeAll()
    }
}
