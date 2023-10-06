//
//  SidebarView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 25.09.23.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        List(appState.games) { game in
            VStack(alignment: .leading) {
                Text("Game \(game.id)")
                    .font(.title3)
                Text(game.sidebarWord)
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    SidebarView()
        .environmentObject(AppState())
}
