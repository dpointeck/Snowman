//
//  GameView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 25.09.23.
//

import SwiftUI

struct GameView: View {

    var body: some View {
        HStack {
            Image("0")
                .resizable()
                .aspectRatio(contentMode: .fit)
            .frame(width: 230)
            Spacer()
            VStack(spacing: 12.0) {
                Spacer()
                Text("Enter a letter to guess the word.")
                    .font(.title2)
                LettersView()
                
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
