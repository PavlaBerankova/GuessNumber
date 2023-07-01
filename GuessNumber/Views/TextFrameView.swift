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
        .font(.largeTitle).bold()
        .foregroundColor(.black)
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color(.lightGray))
            .opacity(0.3)
        )
        .padding(.horizontal, 10)
        .padding(.bottom, 50)
    }
}

struct TextFrameView_Previews: PreviewProvider {
    static var previews: some View {
        TextFrameView(textFirstLine: "Guess the Number", textSecondLine: "🎲 1 ~ 100")
    }
}
