//
//  ContentView.swift
//  Memorize
//
//  Created by Antonio Bunicic on 21.06.2021..
//

import SwiftUI

struct ContentView: View {
    static let vehicles = ["🚜","⛵️","✈️","🚗","🚚","🚐","🛴","🚃","🚀","🚕","🚑","🏍","🚒","🚎"]
    static let animals = ["🐶","🐱","🐹","🐻","🐼","🦁","🐒","🐧","🐝","🐍","🐙","🐠","🦞"]
    static let plants = ["🌵","🌲","🌴","🪴","🌹","🌺","🌼","🌸","🌾","🍀"]
    
    @State var emojis = ContentView.vehicles.shuffled()
    
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id:\.self) {
                        emoji in CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                vehiclesButton
                Spacer()
                animalsButton
                Spacer()
                plantsButton
            }
            .padding(.horizontal)
            .font(.largeTitle)
           
        }
        .padding(.vertical)
    }
    
    var vehiclesButton: some View {
        Button(action: {
            emojis = ContentView.vehicles.shuffled()
        }, label: {
            VStack {
                Image(systemName: "car.2")
                Text("Vehicles").font(.title2)
            }
        })
    }
    
    var animalsButton: some View {
        Button(action: {
            emojis = ContentView.animals.shuffled()
        }, label: {
            VStack {
                Image(systemName: "ladybug")
                Text("Animals").font(.title2)
            }
        })
    }
    
    var plantsButton: some View {
        Button(action: {
            emojis = ContentView.plants.shuffled()
        }, label: {
            VStack {
                Image(systemName: "leaf")
                Text("Plants").font(.title2)
            }
        })
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView().preferredColorScheme(.light)
    }
}
