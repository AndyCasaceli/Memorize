//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/2/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    func choose (card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
