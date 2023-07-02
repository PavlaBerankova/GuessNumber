//
//  AttemptFrameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.07.2023.
//

import SwiftUI

struct AttemptFrameView: View {
    let chooseNumber: Int
    
    var body: some View {
        VStack {
            Text("\(chooseNumber)")
                .font(.system(size: 10))
                .frame(width: 30, height: 30)
            .background(Color.white).cornerRadius(10)
        }
        .padding(.bottom)
        
    }
}

struct AttemptFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .easy)
             HStack {
                 AttemptFrameView(chooseNumber: 95)
                 AttemptFrameView(chooseNumber: 1)
                 AttemptFrameView(chooseNumber: 95)
                 AttemptFrameView(chooseNumber: 95)
                 AttemptFrameView(chooseNumber: 95)
                 
            }
        }
    }
}
