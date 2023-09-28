//
//  GuessesView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 25.09.23.
//

import SwiftUI

struct GuessesView: View {
    @State var nextGuess = ""
    @Binding var game: Game

    let guesses = ["M"]
    var body: some View {
        HStack {
            Text("Letters used:")
            Text(game.guesses.joined(separator: ", "))
        }
        LabeledContent("Guess a letter:") {
            TextField("", text: $nextGuess)
                .frame(width: 50)
                .textFieldStyle(.roundedBorder)
                .disabled(game.gameStatus != .inProgress)
        }
    }
}

#Preview {
    GuessesView(game: .constant(Game()))
}
