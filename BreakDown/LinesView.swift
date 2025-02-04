import SwiftUI

struct LinesView: View {
    @Binding var lines: [Line] // Pass lines from RosterView
    @Binding var players: [Player] // Pass roster players
    
    @State private var showingCreateLineView = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(lines) { line in
                    NavigationLink(destination: EditLineView(line: line, players: $players)) {
                        VStack(alignment: .leading) {
                            Text(line.name)
                                .font(.headline)
                            Text("Players: \(line.players.map { $0.name }.joined(separator: ", "))")
                                .font(.subheadline)
                        }
                        .padding()
                    }
                }
                .onDelete(perform: deleteLine) // Enable swipe-to-delete
            }
            .navigationTitle("Lines")
            .toolbar {
                Button("Create Line") {
                    showingCreateLineView = true
                }
            }
            .sheet(isPresented: $showingCreateLineView) {
                CreateLineView(lines: $lines, players: $players) // Ensure players are passed here
            }
        }
    }

    private func deleteLine(at offsets: IndexSet) {
        lines.remove(atOffsets: offsets)
    }
}
