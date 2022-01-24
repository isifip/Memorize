
import SwiftUI

struct EmojyMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    //MARK: --> Body
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(game.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            game.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}
//MARK: --> Preview
struct EmojyMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGame()
        
        EmojyMemoryGameView(game: game)
            .preferredColorScheme(.dark)
    }
}

//MARK: --> SubViews
struct CardView: View {
    let card: EmojiMemoryGame.Card

    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
    }
}
