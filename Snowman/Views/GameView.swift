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
                    print("Start new game.")
                }
                .keyboardShortcut(/*@START_MENU_TOKEN@*/.defaultAction/*@END_MENU_TOKEN@*/)
                Spacer()
                GuessesView()

            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    GameView()
}
