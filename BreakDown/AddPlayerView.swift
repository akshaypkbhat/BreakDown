import SwiftUI

struct AddPlayerView: View {
    @Binding var players: [Player]  // Binding to update the player list
    @State private var playerName = ""
    @State private var selectedPosition: Position = .offense
    @State private var playerNumber: String = ""
    var playerToEdit: Player?  // Optional player to edit

    init(players: Binding<[Player]>, playerToEdit: Player? = nil) {
        _players = players
        _playerName = State(initialValue: playerToEdit?.name ?? "")
        _selectedPosition = State(initialValue: playerToEdit?.position ?? .offense)
        _playerNumber = State(initialValue: playerToEdit != nil ? String(playerToEdit!.playerNumber) : "")
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Player Info")) {
                    TextField("Player Name", text: $playerName)
                    
                    Picker("Position", selection: $selectedPosition) {
                        ForEach(Position.allCases, id: \.self) { position in
                            Text(position.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Player Number", text: $playerNumber)
                        .keyboardType(.numberPad)
                        .onReceive(playerNumber.publisher.collect()) {
                            self.playerNumber = String($0.prefix(2)) // Limit number to two digits
                        }
                }
                
                Button(playerToEdit == nil ? "Add Player" : "Save Changes") {
                    if let number = Int(playerNumber), !playerName.isEmpty {
                        if let existingPlayer = playerToEdit {
                            // Edit the existing player
                            if let index = players.firstIndex(where: { $0.id == existingPlayer.id }) {
                                players[index] = Player(name: playerName, position: selectedPosition, playerNumber: number)
                            }
                        } else {
                            // Add a new player
                            let newPlayer = Player(name: playerName, position: selectedPosition, playerNumber: number)
                            players.append(newPlayer)
                        }

                        // Clear fields after saving
                        playerName = ""
                        playerNumber = ""
                    }
                }
            }
            .navigationTitle(playerToEdit == nil ? "Add Player" : "Edit Player")
        }
    }
}
