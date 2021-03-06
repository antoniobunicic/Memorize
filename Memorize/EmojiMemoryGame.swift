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
        [ "Vehicles": ["ð","âĩïļ","âïļ","ð","ð","ð","ðī","ð","ð","ð","ð","ð","ð","ð"],
          "Animals":
            ["ðķ","ðą","ðđ","ðŧ","ðž","ðĶ","ð","ð§","ð","ð","ð","ð ","ðĶ"],
          "Plants":
            ["ðĩ","ðē","ðī","ðŠī","ðđ","ðš","ðž","ðļ","ðū","ð"],
          "Fruits":
            ["ð","ð","ð","ð","ð","ð","ð","ð","ðŦ","ð","ð","ð","ðĨ­"],
          "Vegetables":
            ["ð","ð","ðĨ","ðĨĶ","ðĨŽ","ðĨ","ðķ","ðŦ","ð―","ðĨ","ðŦ","ð§","ð§","ðĨ"],
          "Gluten Paradise":
            ["ðĨ","ðĨŊ","ð","ðĨ","ðĨĻ","ðĨ","ð§","ðŠ","ð","ð­","ðĨ§"]
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
