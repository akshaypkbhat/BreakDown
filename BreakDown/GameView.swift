import SwiftUI

struct GameView: View {
    @Binding var lines: [Line]
    @State private var games: [Game] = []
    @State private var showingNewGameView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(games) { game in
                    NavigationLink(destination: GameDetailView(game: game)) {
                        VStack(alignment: .leading) {
                            Text("Game on \(game.date, formatter: DateFormatter.shortDate)")
                            Text("Score: \(game.score.team) - \(game.score.opponent)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteGame)
            }
            .navigationTitle("Games")
            .toolbar {
                Button("New Game") {
                    showingNewGameView = true
                }
            }
            .sheet(isPresented: $showingNewGameView) {
                NewGameView(games: $games, lines: $lines)
            }
        }
    }

    private func deleteGame(at offsets: IndexSet) {
        games.remove(atOffsets: offsets)
    }
} 