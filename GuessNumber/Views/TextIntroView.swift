//
//  TextBorder.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct TextIntroView: View {
    let textFirstLine: String
    let textSecondLine: String?
    
    var body: some View {
        VStack {
            Image(systemName: "questionmark.bubble")
                .resizable()
                .frame(width: 100, height: 100)
                
            
            Text(textFirstLine)
                .padding(3)
            
            Text(textSecondLine ?? "")
        }
        .font(.title).bold()
        .foregroundColor(.white)
        .shadow(color: Color(.black).opacity(0.6), radius: 5)
    }
}


struct TextIntroView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .menu)
            VStack {
                TextIntroView(textFirstLine: "Guess the Number", textSecondLine: "🎲 1 ~ 100")
            }
            .padding(.horizontal)
        }
        
    }
}
