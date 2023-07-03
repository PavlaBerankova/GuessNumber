//
//  Buttons.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct LevelButtonsView: View {
    var title: String
    var colorText: Color
    var colorFrame: Color
   
    
    var body: some View {
        HStack {
            HStack {
                Text("Level".uppercased())
                Text(title.uppercased()).bold()
            }
           
                .font(.title)
                
                .foregroundColor(colorText)
                .frame(width: 250, height: 80)
                .background(RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(colorFrame))
        }
    }
}

struct LevelButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .menu)
            VStack {
                LevelButtonsView(title: "easy", colorText: Color("Plum"), colorFrame: .white)
                LevelButtonsView(title: "hard", colorText: Color("Plum"), colorFrame: .white)
            }
            .padding(.horizontal, 20)
        }
    }
}

