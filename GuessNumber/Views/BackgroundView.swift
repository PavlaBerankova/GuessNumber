//
//  Templates.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//

import SwiftUI

enum Screen {
    case easy, hard, menu
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    init(screen: Screen) {
        self.topColor = Color("Blueberry")
        
        switch screen {
        case .easy:
            bottomColor = Color(.orange)
        case .hard:
            bottomColor = Color(.red)
        case .menu:
            bottomColor = Color("background2")
            
        }
    }
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topTrailing, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(screen: .menu)
    }
}
