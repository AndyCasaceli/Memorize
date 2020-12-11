//
//  Grid.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/11/20.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
//    let testCard1 = MemoryGame.Card(id: 1, isFaceUp: true, isMatched: false, content: "👻")
//    let testCard2 = MemoryGame.Card(id: 2, isFaceUp: true, isMatched: false, content: "🧙")
//    let testCard3 = MemoryGame.Card(id: 3, isFaceUp: true, isMatched: false, content: "😈")
//    let testCard4 = MemoryGame.Card(id: 4, isFaceUp: true, isMatched: false, content: "🎃")
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: size)
        }
    }
    
    func body(for item: Item, in size: CGSize) -> some View {
        return viewForItem(item)
    }
    
}
