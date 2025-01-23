//
//  RosterView.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import SwiftUI

struct RosterView: View {
    @State private var players: [Player] = []

    var body: some View {
        NavigationView {
            List(players) { player in
                HStack {
                    Text(player.name)
                    Spacer()
                    Text(player.position.rawValue)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Player Roster")
            .toolbar {
                NavigationLink(destination: AddPlayerView(players: $players)) {
                    Text("Add Player")
                }
            }
        }
    }
}
