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
    @FocusState var entryFieldHasFocus: Bool

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
                .onChange(of: nextGuess) { newValue in
                    game.processGuess(letter: newValue)
                    nextGuess = ""
                }.focused($entryFieldHasFocus)
                .onChange(of: game.gameStatus) { _ in
                    entryFieldHasFocus = true
                }
        }
    }
}

#Preview {
    GuessesView(game: .constant(Game()))
}
