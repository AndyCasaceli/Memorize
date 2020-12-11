//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/2/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose (card: Card) {
        print("card chosen: \(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    print("we got a match!")
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
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
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
