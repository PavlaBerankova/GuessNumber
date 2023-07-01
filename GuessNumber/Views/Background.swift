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

struct Background: View {
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
        
//        LinearGradient(colors: [Color("background1"), .indigo], startPoint: .top, endPoint: .bottom)
//        RadialGradient(stops: [
//            .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
//            .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
//                       center: .top, startRadius: 200, endRadius: 650)
    }
}





struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background(screen: .menu)
    }
}
