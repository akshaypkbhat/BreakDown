import SwiftUI

struct RosterView: View {
    @State private var players: [Player] = []

    var body: some View {
        NavigationView {
            // List all Players
            List(players) { player in
                // Make the entire row tappable to navigate to the edit view
                NavigationLink(destination: AddPlayerView(players: $players, playerToEdit: player)) {
                    HStack {
                        Text(player.name)
                        Spacer()
                        Text("No. \(player.playerNumber)") // Display player number
                            .foregroundColor(.gray)
                        Text(player.position.rawValue)
                            .foregroundColor(.blue)
                            .font(.subheadline)
                    }
                    .padding()
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
