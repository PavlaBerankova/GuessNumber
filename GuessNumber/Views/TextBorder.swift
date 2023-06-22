//
//  TextBorder.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct TextBorder: View {
    let textIntro: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(textIntro)
                .font(.largeTitle).bold()
                .foregroundColor(.black)
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.lightGray))
                    .opacity(0.2)
                )
        }
        .padding(.horizontal, 30)
    }
}

struct TextBorder_Previews: PreviewProvider {
    static var previews: some View {
        TextBorder(textIntro: "Guess the Number🎲 1 ~ 100")
    }
}
