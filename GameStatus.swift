//
//  GameStatus.swift
//  Snowman
//
//  Created by Daniel Pointecker on 26.09.23.
//

import SwiftUI

enum GameStatus {
    case won
    case lost
    case inProgress

    var displayStatus: Text {
        switch self {
        case .inProgress:
            return Text("In progress...")
        case .lost:
            let img = Image(systemName: "person.full.turn.down")
            return Text("You lost \(img)")
        case .won:
            return Text("You won! \(img)")
        }
    }
}
