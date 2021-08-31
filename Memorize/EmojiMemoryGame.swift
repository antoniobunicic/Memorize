//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Antonio Bunicic on 26.06.2021..
//  ViewModel
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    static let emojisByTheme: Dictionary<String, Array<String>> =
        [ "Vehicles": ["🚜","⛵️","✈️","🚗","🚚","🚐","🛴","🚃","🚀","🚕","🚑","🏍","🚒","🚎"],
          "Animals":
            ["🐶","🐱","🐹","🐻","🐼","🦁","🐒","🐧","🐝","🐍","🐙","🐠","🦞"],
          "Plants":
            ["🌵","🌲","🌴","🪴","🌹","🌺","🌼","🌸","🌾","🍀"],
          "Fruits":
            ["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🫐","🍓","🍒","🍑","🥭"],
          "Vegetables":
            ["🍅","🍆","🥑","🥦","🥬","🥒","🌶","🫑","🌽","🥕","🫒","🧄","🧅","🥔"],
          "Gluten Paradise":
            ["🥐","🥯","🍞","🥖","🥨","🥞","🧇","🍪","🍔","🌭","🥧"]
        ]

    static func createMemoryGame() -> MemoryGame<String> {
        let randomKeyValue = EmojiMemoryGame.emojisByTheme.randomElement();
        return MemoryGame<String>(theme: randomKeyValue!.key, numberOfPairs: 8) {
            pairIndex in randomKeyValue!.value[pairIndex] }
    }
        
    @Published private var model = createMemoryGame()

    var theme: String {
        model.theme
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        // objectWillChange.send() - not needed because of @Published
        model.choose(card)
    }
    
    func newGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}
