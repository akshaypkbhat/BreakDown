import SwiftUI

struct RosterView: View {
    @Binding var players: [Player] // Use binding to pass players

    @State private var lines: [Line] = [] // Store lines here

    var body: some View {
        NavigationStack {
            VStack {
                List(players) { player in
                    NavigationLink(destination: AddPlayerView(players: $players, playerToEdit: player)) {
                        HStack {
                            Text(player.name)
                            Spacer()
                            Text("No. \(player.playerNumber)")
                                .foregroundColor(.gray)
                            Text(player.position.rawValue)
                                .foregroundColor(.blue)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Roster")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddPlayerView(players: $players)) {
                        Text("Add Player")
                    }
                }
            }
        }
    }
}

#Preview {
    RosterView(players: .constant([
        Player(name: "John Doe", position: .defense, playerNumber: 10),
        Player(name: "Jane Smith", position: .offense, playerNumber: 23),
        Player(name: "jerry Doe", position: .defense, playerNumber: 10),
        Player(name: "heff Smith", position: .offense, playerNumber: 23),
        Player(name: "jill Doe", position: .defense, playerNumber: 10),
        Player(name: "joe Smith", position: .offense, playerNumber: 23),
        Player(name: "Jam Doe", position: .defense, playerNumber: 10),
        Player(name: "jon Smith", position: .offense, playerNumber: 23)
    ]))
}
