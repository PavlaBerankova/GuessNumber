//
//  Templates.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//

import SwiftUI

struct Background: View {
    var body: some View {
        LinearGradient(colors: [.purple, .indigo], startPoint: .top, endPoint: .bottom)
        
//        LinearGradient(colors: [Color("background1"), .indigo], startPoint: .top, endPoint: .bottom)
//        RadialGradient(stops: [
//            .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
//            .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
//                       center: .top, startRadius: 200, endRadius: 650)
    }
}





struct Templates_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
