//
//  Game.swift
//  Snowman
//
//  Created by Daniel Pointecker on 26.09.23.
//

import Foundation

struct Game {
    var incorrectGuessCount = 0
    var statusText = "Enter a letter to start the game"
    var word = "SNOWMAN"
    var guesses: [String] = ["S", "M"]
    var gameStatus = GameStatus.inProgress
    var letters: [Letter] {
        var lettersArray: [Letter] = []

        for (index, char) in word.enumerated() {
            let charString = String(char)
            if guesses.contains(charString) {
                let letter = Letter(id: index, char: charString)
                lettersArray.append(letter)
            } else if gameStatus == .lost {
                let letter = Letter(id: index, char: charString, color: .red)
                lettersArray.append(letter)
            } else {
                let letter = Letter(id: index, char: "")
                lettersArray.append(letter)
            }
        }
        return lettersArray
    }
}
