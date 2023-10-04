//
//  ContentView.swift
//  Snowman
//
//  Created by Daniel Pointecker on 23.09.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            GameView()
        }
        .frame(minWidth: 1100, minHeight: 500)
    }
}

#Preview {
    ContentView()
}
