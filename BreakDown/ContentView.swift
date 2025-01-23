//
//  ContentView.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Roster Tab
            RosterView()
                .tabItem {
                    Label("Roster", systemImage: "person.3.fill")  // Tab icon and title
                }
            
            // Lines Tab
            LinesView()
                .tabItem {
                    Label("Lines", systemImage: "line.3.horizontal.decrease.circle.fill")  // Tab icon and title
                }
            
            // Game Tab
            GameView()
                .tabItem {
                    Label("Game", systemImage: "gamecontroller.fill")  // Tab icon and title
                }
        }
        .accentColor(.blue)  // Optional: Accent color for the selected tab
    }
}
