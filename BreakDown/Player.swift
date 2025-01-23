//
//  Player.swift
//  BreakDown
//
//  Created by Akshay Bhatia on 1/23/25.
//

import Foundation

enum Position: String, CaseIterable {
    case offense = "Offense"
    case defense = "Defense"
    case both = "Both"
}

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var position: Position
}
