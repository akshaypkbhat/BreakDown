//
//  ContentView.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var lines: [Line] = [] // Initialize lines
    @State private var players: [Player] = [
        Player(name: "John Doe", position: .defense, playerNumber: 10),
        Player(name: "Jane Smith", position: .offense, playerNumber: 23),
        Player(name: "jerry Doe", position: .defense, playerNumber: 10),
        Player(name: "heff Smith", position: .offense, playerNumber: 23),
        Player(name: "jill Doe", position: .defense, playerNumber: 10),
        Player(name: "joe Smith", position: .offense, playerNumber: 23),
        Player(name: "Jam Doe", position: .defense, playerNumber: 10),
        Player(name: "jon Smith", position: .offense, playerNumber: 23)
    ] // Ensure all players are initialized here

    var body: some View {
        TabView {
            // Roster Tab
            RosterView(players: $players)
                .tabItem {
                    Label("Roster", systemImage: "person.3.fill")  // Tab icon and title
                }
            
            // Lines Tab
            LinesView(lines: $lines, players: $players) // Pass bindings
                .tabItem {
                    Label("Lines", systemImage: "line.3.horizontal.decrease.circle.fill")  // Tab icon and title
                }
            
            // Games Tab
            GameView(lines: $lines) // Pass lines to GameView
                .tabItem {
                    Label("Games", systemImage: "gamecontroller.fill")  // Tab icon and title
                }
        }
        .accentColor(.blue)  // Optional: Accent color for the selected tab
    }
}

#Preview {
    ContentView()
}
