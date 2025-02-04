import Foundation

struct Game: Identifiable {
    var id = UUID()
    var date: Date
    var lines: [Line]
    var score: (team: Int, opponent: Int)
    var playerStats: [PlayerStats]
}

struct PlayerStats: Identifiable {
    var id = UUID()
    var player: Player
    var turns: Int
    var ds: Int
    var points: Int
} 