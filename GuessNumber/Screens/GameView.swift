//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct GameView: View {
    let title: String
    let attempts: Int
    let backgroundColor: Screen
    
    @State private var userNumber: Int!
    
    var body: some View {
        ZStack {
            Background(screen: backgroundColor)
            
            VStack {
                TextFrame(textFirstLine: "\(title)".uppercased(), textSecondLine: "ATTEMPTS: \(attempts)")
                
                TextField("1~100",value: $userNumber, format: .number)
                                        .frame(width: 80, height: 40)
                                        .padding()
                                        .background(.regularMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .font(.title)
//                                        .focused($isInputActive)
                                        .shadow(radius: 5)
                                        .keyboardType(.numberPad)
            } //: VSTACK
            .padding(.horizontal, 20)
            
            Spacer()
        } //: ZSTACK
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(title: "EASY", attempts: 10, backgroundColor: .easy)
    }
}
