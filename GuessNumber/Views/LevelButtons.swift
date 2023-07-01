//
//  Buttons.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct LevelButtons: View {
    var title: String
    var colorText: Color
    var colorFrame: Color
   
    
    var body: some View {
        Text(title.uppercased())
            .font(.largeTitle)
            .foregroundColor(colorText)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(RoundedRectangle(cornerRadius: 20).stroke(style: StrokeStyle(lineWidth: 5))
                .foregroundColor(colorFrame))
            .padding(.horizontal, 40)
    }
}

struct LevelButtons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LevelButtons(title: "easy", colorText: .white, colorFrame: Color("Plum"))
        }
        .padding(.horizontal, 20)
       
    }
}

