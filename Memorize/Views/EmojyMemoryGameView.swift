
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
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: card.isMatched)
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let fontScale: CGFloat = 0.68
        static let fontSize: CGFloat = 32
    }
}
