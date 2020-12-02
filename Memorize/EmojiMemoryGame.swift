//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/2/20.
//

import SwiftUI

class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = [ "👻", "🎃", "😈" ]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
