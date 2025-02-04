//
//  Line.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import Foundation

// Define the Line model to hold the starters and substitutes
struct Line: Identifiable, Equatable {
    var id = UUID()
    var name: String
    var players: [Player]
}

