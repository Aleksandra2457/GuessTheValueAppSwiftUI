//
//  GuessTheValueAppSwiftUIApp.swift
//  GuessTheValueAppSwiftUI
//
//  Created by Александра Лесовская on 23.05.2022.
//

import SwiftUI

@main
struct GuessTheValueAppSwiftUIApp: App {
    
    @StateObject private var gameManager = GameManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(GameManager())
        }
    }
}
