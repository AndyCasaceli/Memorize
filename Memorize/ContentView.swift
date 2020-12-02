//
//  ContentView.swift
//  Memorize
//
//  Created by Andy Casaceli on 12/1/20.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        let numberOfCards = viewModel.cards.count
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
                .aspectRatio(2 / 3, contentMode: .fit)  // Provide height/width ratio per Task 3
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(numberOfCards > 8 ? .title : .largeTitle)  // Change font based on number of cards in game per Task 5
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
