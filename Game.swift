//
//  Game.swift
//  Snowman
//
//  Created by Daniel Pointecker on 26.09.23.
//

import Foundation

struct Game: Identifiable {
    let id: Int
    var incorrectGuessCount = 0
    var statusText = "Enter a letter to start the game"
    var word = "SNOWMAN"
    var guesses: [String] = []
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

    init(id: Int) {
        self.id = id
        word = getRandomWord()
    }

    var sidebarWord: String {
        if gameStatus == .inProgress {
            return "???"
        }

        return word
    }

    mutating func processGuess(letter: String) {
        guard
            let newGuess = letter.first?.uppercased(),
            newGuess >= "A" && newGuess <= "Z",
            !guesses.contains(newGuess)
        else {
            return
        }

        if !word.contains(newGuess) && incorrectGuessCount < 7 {
            incorrectGuessCount += 1
        }
        guesses.append(newGuess)
        checkForGameOver()
    }

    mutating func checkForGameOver() {
        let unmatchedLetters = word.filter { letter in
            !guesses.contains(String(letter))
        }

        if unmatchedLetters.isEmpty {
            gameStatus = .won
            statusText = "HURRAY!!! YOU WON!"
        } else if incorrectGuessCount == 7 {
            gameStatus = .lost
            statusText = "You lost. Better luck next time."
        } else {
            statusText = "Enter another letter to guess the word."
        }
    }

    func getRandomWord() -> String {
        guard
            let url = Bundle.main.url(forResource: "words", withExtension: "txt"),
            let wordList = try? String(contentsOf: url)
        else {
            return "SNOWMAN"
        }

        let words = wordList.components(separatedBy: .newlines).filter { word in
            word.count >= 4 && word.count <= 10
        }
        let word = words.randomElement() ?? "SNOWMAN"
        print(word)
        return word.uppercased()
    }
}
