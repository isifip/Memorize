//
//  ContentView.swift
//  Memorize
//
//  Created by Irakli Sokhaneishvili on 21.01.22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦼", "🛴", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖"]
    @State var emojiCount = 4
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
        
    }
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .foregroundColor(.white)
                .background(Circle().foregroundColor(.blue))
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding()
                .foregroundColor(.white)
                .background(Circle().foregroundColor(.blue))
        }
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
                shape.strokeBorder(lineWidth: 3)
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
