//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Irakli Sokhaneishvili on 21.01.22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojyMemoryGameView(game: game)
        }
    }
}
