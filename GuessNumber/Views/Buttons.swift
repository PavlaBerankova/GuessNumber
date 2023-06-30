//
//  Buttons.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct Buttons: View {
    var title: String
    var color: Color
   
    
    var body: some View {
        Text(title.uppercased())
            .font(.largeTitle).bold()
            .foregroundColor(color)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(RoundedRectangle(cornerRadius: 20).stroke(style: StrokeStyle(lineWidth: 5))
                .foregroundColor(color))
            .padding(.horizontal, 40)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Buttons(title: "easy", color: .indigo)
        }
        .padding(.horizontal, 20)
       
    }
}

