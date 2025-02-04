import SwiftUI

struct GameDetailView: View {
    var game: Game

    var body: some View {
        Form {
            Section(header: Text("Game Date")) {
                Text("\(game.date, formatter: DateFormatter.shortDate)")
            }

            Section(header: Text("Score")) {
                Text("Team: \(game.score.team)")
                Text("Opponent: \(game.score.opponent)")
            }

            Section(header: Text("Player Stats")) {
                ForEach(game.playerStats) { stat in
                    VStack(alignment: .leading) {
                        Text(stat.player.name)
                        Text("Turns: \(stat.turns)")
                        Text("D's: \(stat.ds)")
                        Text("Points: \(stat.points)")
                    }
                }
            }
        }
        .navigationTitle("Game Details")
    }
} 