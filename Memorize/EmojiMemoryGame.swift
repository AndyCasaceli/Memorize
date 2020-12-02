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
        let emojis = [ "👻", "🎃", "😈", "🕷", "🧙" ]
        let randomNumberOfPairs = Int.random(in: 2...5)  // Generate random number of pairs between 2 and 5 per Task 4
        return MemoryGame<String>(numberOfPairsOfCards: randomNumberOfPairs) { pairIndex in
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
