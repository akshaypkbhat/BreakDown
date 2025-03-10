import SwiftUI

struct CreateLineView: View {
    @Binding var lines: [Line]
    @Binding var players: [Player]
    
    @State private var lineName = ""
    @State private var selectedPlayers: [Player] = [] // Players added to the line

    var body: some View {
        Form {
            // Line name
            Section(header: Text("Line Name")) {
                TextField("Enter Line Name", text: $lineName)
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
            Button("Save Line") {
                if !lineName.isEmpty {
                    let newLine = Line(name: lineName, players: selectedPlayers)
                    lines.append(newLine) // Save the new line
                    clearForm()
                }
            }
            .disabled(lineName.isEmpty) // Only disable if line name is empty
        }
        .navigationTitle("Create Line")
    }

    private func togglePlayerSelection(_ player: Player) {
        if let index = selectedPlayers.firstIndex(of: player) {
            selectedPlayers.remove(at: index)
        } else {
            selectedPlayers.append(player)
        }
    }

    private func clearForm() {
        lineName = ""
        selectedPlayers.removeAll()
    }
}
