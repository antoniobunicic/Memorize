//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonio Bunicic on 26.06.2021..
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static let vehicles = ["🚜","⛵️","✈️","🚗","🚚","🚐","🛴","🚃","🚀","🚕","🚑","🏍","🚒","🚎"]
    static let animals = ["🐶","🐱","🐹","🐻","🐼","🦁","🐒","🐧","🐝","🐍","🐙","🐠","🦞"]
    static let plants = ["🌵","🌲","🌴","🪴","🌹","🌺","🌼","🌸","🌾","🍀"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairs: 4) { pairIndex in EmojiMemoryGame.vehicles[pairIndex] }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()

    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        // objectWillChange.send() - not needed because of @Published
        model.choose(card)
    }
    
}
