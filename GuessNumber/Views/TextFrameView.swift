//
//  TextBorder.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct TextFrameView: View {
    let textFirstLine: String
    let textSecondLine: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(textFirstLine)
                .padding(3)
            Text(textSecondLine)
                
        }
        .font(.title).bold()
        .foregroundColor(.white)
        .padding()
        .padding(.bottom, 80)
//        .frame(maxWidth: .infinity)
//        .frame(height: 150)
//        .background(RoundedRectangle(cornerRadius: 10)
//            .fill(Color(.white))
            
    }
}

struct TextFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .menu)
            VStack {
                TextFrameView(textFirstLine: "Guess the Number", textSecondLine: "🎲 1 ~ 100")
            }
            .padding(.horizontal)
        }
       
    }
}
