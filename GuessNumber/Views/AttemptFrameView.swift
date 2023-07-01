//
//  AttemptFrameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.07.2023.
//

import SwiftUI

struct AttemptFrameView: View {
    let chooseNumber: String
    
    var body: some View {
        VStack {
            Text("\(chooseNumber)")
                .font(.title2)
                .padding()
                .frame(width: 60, height: 60)
            .background(Color.white.opacity(0.5).cornerRadius(20))
        }
        .padding(.bottom)
        
    }
}

struct AttemptFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .easy)
             HStack {
                 AttemptFrameView(chooseNumber: "95")
                 AttemptFrameView(chooseNumber: "1")
                 AttemptFrameView(chooseNumber: "95")
                 AttemptFrameView(chooseNumber: "95")
                 AttemptFrameView(chooseNumber: "95")
                 
            }
        }
    }
}
