//
//  ContentView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 23.09.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appState: AppState

    var body: some View {
        NavigationSplitView {
            SidebarView(appState: AppState())
        } detail: {
            GameView(appState: AppState())
        }
        .frame(minWidth: 1100, minHeight: 500)
    }
}

#Preview {
    ContentView(appState: AppState())
}
