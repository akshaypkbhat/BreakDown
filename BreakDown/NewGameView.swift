import SwiftUI

struct NewGameView: View {
    @Binding var games: [Game]
    @Binding var lines: [Line]
    @State private var selectedLine: Line?
    @State private var teamScore = 0
    @State private var opponentScore = 0
    @State private var playerStats: [PlayerStats] = []

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Select Line")) {
                    ForEach(lines) { line in
                        lineSelectionView(for: line)
                    }
                }

                Section(header: Text("Score")) {
                    Stepper("Team Score: \(teamScore)", value: $teamScore)
                    Stepper("Opponent Score: \(opponentScore)", value: $opponentScore)
                }

                Section(header: Text("Player Stats")) {
                    ForEach(playerStats) { stat in
                        playerStatsView(for: stat)
                    }
                }

                Button("Start Game") {
                    if let line = selectedLine {
                        let newGame = Game(date: Date(), lines: [line], score: (teamScore, opponentScore), playerStats: playerStats)
                        games.append(newGame)
                    }
                }
                .disabled(selectedLine == nil)
            }
            .navigationTitle("New Game")
        }
    }

    private func lineSelectionView(for line: Line) -> some View {
        HStack {
            Text(line.name)
            Spacer()
            if selectedLine == line {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            selectedLine = line
            playerStats = line.players.map { PlayerStats(player: $0, turns: 0, ds: 0, points: 0) }
        }
    }

    private func playerStatsView(for stat: PlayerStats) -> some View {
        VStack(alignment: .leading) {
            Text(stat.player.name)
            Stepper("Turns: \(stat.turns)", value: Binding(
                get: { stat.turns },
                set: { newValue in
                    if let index = playerStats.firstIndex(where: { $0.id == stat.id }) {
                        playerStats[index].turns = newValue
                    }
                }
            ))
            Stepper("D's: \(stat.ds)", value: Binding(
                get: { stat.ds },
                set: { newValue in
                    if let index = playerStats.firstIndex(where: { $0.id == stat.id }) {
                        playerStats[index].ds = newValue
                    }
                }
            ))
            Stepper("Points: \(stat.points)", value: Binding(
                get: { stat.points },
                set: { newValue in
                    if let index = playerStats.firstIndex(where: { $0.id == stat.id }) {
                        playerStats[index].points = newValue
                    }
                }
            ))
        }
    }
} 