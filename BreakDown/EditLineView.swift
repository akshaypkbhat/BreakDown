import SwiftUI

struct EditLineView: View {
    @State var line: Line
    @Binding var players: [Player]
    
    @State private var selectedPlayers: [Player]

    init(line: Line, players: Binding<[Player]>) {
        self._line = State(initialValue: line)
        self._players = players
        self._selectedPlayers = State(initialValue: line.players)
    }

    var body: some View {
        Form {
            // Line name
            Section(header: Text("Line Name")) {
                TextField("Enter Line Name", text: $line.name)
            }

            // List of players
            Section(header: Text("Available Players")) {
                ForEach(players) { player in
                    HStack {
                        Text(player.name)
                        Spacer()
                        if selectedPlayers.contains(player) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        }
                    }
                    .contentShape(Rectangle()) // Makes the entire row tappable
                    .onTapGesture {
                        togglePlayerSelection(player)
                    }
                }
            }

            // Show selected players
            Section(header: Text("Selected Players (\(selectedPlayers.count))")) {
                ForEach(selectedPlayers) { player in
                    Text(player.name)
                }
            }

            // Save the line
            Button("Save Changes") {
                line.players = selectedPlayers
                // Update the line in the parent view
                // This might require additional logic to update the line in the lines array
            }
            .disabled(line.name.isEmpty) // Only disable if line name is empty
        }
        .navigationTitle("Edit Line")
    }

    private func togglePlayerSelection(_ player: Player) {
        if let index = selectedPlayers.firstIndex(of: player) {
            selectedPlayers.remove(at: index)
        } else {
            selectedPlayers.append(player)
        }
    }
} 