//
//  LinesView.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import SwiftUI

struct LinesView: View {
    @State private var lines: [Line] = []
    @State private var showingCreateLineView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(lines) { line in
                    VStack(alignment: .leading) {
                        Text(line.name)
                            .font(.headline)
                        Text("Players: \(line.starters.map { $0.name }.joined(separator: ", "))")
                            .font(.subheadline)
                    }
                    .padding()
                }
            }
            .navigationTitle("Lines")
            .toolbar {
                Button("Create Line") {
                    showingCreateLineView = true
                }
            }
            .sheet(isPresented: $showingCreateLineView) {
                CreateLineView(lines: $lines)
            }
        }
    }
}

