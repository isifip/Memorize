//
//  Cardify.swift
//  Memorize
//
//  Created by Irakli Sokhaneishvili on 24.01.22.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: DrawingConstants.CornerRadius)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                
            } else {
                shape.fill()
            }
            content
                .opacity(isFaceUp ? 1.0 : 0)
        }
    }
    
    private struct DrawingConstants {
        static let CornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
