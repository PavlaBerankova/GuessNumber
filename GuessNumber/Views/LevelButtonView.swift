//
//  Buttons.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct LevelButtonView: View {
    var firstTitle: String
    var secondTitle: String
    var thirdTitle: String?
    var colorText = Color("background2")
    var colorFrame = Color(.white)
    
    
    var body: some View {
        HStack {
            HStack {
                Text(firstTitle)
                Text(secondTitle).bold()
                Text(thirdTitle ?? "").bold()
            }
            .font(.title)
            .foregroundColor(colorText)
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(colorFrame)
                    .shadow(color: Color(.black).opacity(0.6), radius: 10)
            )
        }
    }
}

struct LevelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .menu)
            VStack(spacing: 40) {
                LevelButtonView(firstTitle: "LEVEL", secondTitle: "EASY")
                LevelButtonView(firstTitle: "LEVEL", secondTitle: "HARD")
            }
            .padding(.horizontal, 20)
        }
    }
}

