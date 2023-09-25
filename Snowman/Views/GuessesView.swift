//
//  GuessesView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 25.09.23.
//

import SwiftUI

struct GuessesView: View {
    let guesses = ["E", "S", "R", "X"]
    var body: some View {
        HStack {
            Text("Letters used:")
            Text(guesses.joined(separator: ", "))
        }
        LabeledContent("Guess a letter:") {
            Text("Q")
        }
    }
}

#Preview {
    GuessesView()
}
