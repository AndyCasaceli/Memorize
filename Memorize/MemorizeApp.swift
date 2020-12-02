//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/1/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
