//
//  Player.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import Foundation

enum Position: String, CaseIterable {
    case offense = "Offense"
    case both = "Both"
    case defense = "Defense"
}

struct Player: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var position: Position
    var playerNumber: Int
}
