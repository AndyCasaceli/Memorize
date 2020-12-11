//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/2/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    mutating func choose (card: Card) {
        print("card chosen: \(card)")
        let chosenIndex: Int = cards.firstIndex(matching: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
            cards.shuffle() // Shuffle the cards per Task 2
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
