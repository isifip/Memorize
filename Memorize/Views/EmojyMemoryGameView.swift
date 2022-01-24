
import SwiftUI

struct EmojyMemoryGameView: View {
    
    @ObservedObject var game: EmojiMemoryGame
    
    let columns = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    //MARK: --> Body
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
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
        GeometryReader { geometry in
            ZStack {
                    Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20))
                        .padding(5)
                        .opacity(0.5)
                    Text(card.content)
                        .font(font(in: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.68
    }
}
