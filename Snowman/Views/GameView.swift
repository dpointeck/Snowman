//
//  GameView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 25.09.23.
//

import SwiftUI

struct GameView: View {
    @State var game = Game()

    var body: some View {
        HStack {
            Image("\(game.incorrectGuessCount)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            .frame(width: 230)
            Spacer()
            VStack(spacing: 12.0) {
                Spacer()
                Text("\(game.statusText)")
                    .font(.title2)
                LettersView(letters: game.letters)
                Spacer()
                Button("New Game") {
                    game = Game()
                }
                .keyboardShortcut(/*@START_MENU_TOKEN@*/.defaultAction/*@END_MENU_TOKEN@*/)
                .opacity(game.gameStatus == .inProgress ? 0 : 1)
                .disabled(game.gameStatus == .inProgress)
                Spacer()
                GuessesView(game: $game)

            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    GameView()
}
