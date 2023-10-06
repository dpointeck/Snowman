//
//  SnowmanApp.swift
//  Snowman
//
//  Created by Daniel Pointecker on 23.09.23.
//

import SwiftUI

@main
struct SnowmanApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appState)
        }
    }
}
