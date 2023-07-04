//
//  AttemptsFrameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 04.07.2023.
//

import SwiftUI

struct TestAttempts: View {
    let titleAttempts: String
    let attemptsInt: Int
    
    var body: some View {
        VStack {
            Text("\(titleAttempts)")
                .underline()
                .padding(.bottom, 3)
            Text("\(attemptsInt)")
        }
        .font(.title).bold()
        .foregroundColor(Color("background2"))
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(.white)
        .cornerRadius(25)
        .shadow(color: Color(.black).opacity(0.6), radius: 10)
    }
}


struct TestAttempts_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .easy)
            VStack {
                TestAttempts(titleAttempts: "ATTEMPTS", attemptsInt: 10)
            }
            .padding(.horizontal)
        }
       
    }
}
