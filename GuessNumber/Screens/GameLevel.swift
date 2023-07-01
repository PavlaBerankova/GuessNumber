//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct GameLevel: View {
    let title: String
    let attempts: Int
    let backgroundColor: Screen
    
    @State private var userNumber: Int!
    
    var body: some View {
        ZStack {
            BackgroundView(screen: backgroundColor)
            
            VStack {
                TextFrameView(textFirstLine: "\(title)".uppercased(), textSecondLine: "ATTEMPTS: \(attempts)")
                
                
            } //: VSTACK
            .padding(.horizontal, 20)
            
            Spacer()
        } //: ZSTACK
    }
}

struct GameLevel_Previews: PreviewProvider {
    static var previews: some View {
        GameLevel(title: "EASY", attempts: 10, backgroundColor: .easy)
    }
}
