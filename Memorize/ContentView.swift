//
//  ContentView.swift
//  Memorize
//
//  Created by Irakli Sokhaneishvili on 21.01.22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖"]
    var emojiCount = 6
    
    var body: some View {
        HStack {
            ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct CardView: View {
    
    @State private var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
}
