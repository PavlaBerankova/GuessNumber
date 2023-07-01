//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct GameLevel: View {
    let title: String
    let attempts: Int
    let backgroundColor: Screen
    
    @State private var userNumber: Int!
    @State private var testNumber = "56"
    var userAttempts = [String]()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(screen: backgroundColor)
                
                VStack {
                    TextFrameView(textFirstLine: "\(title)".uppercased(), textSecondLine: "ATTEMPTS: \(attempts)")
                    
                    AttemptFrameView(chooseNumber: testNumber)
                    
                    TextFieldView()
                    Spacer()
                } //: VSTACK
                .padding(.horizontal, 20)
            } //: ZSTACK
            .navigationTitle("LEVEL: \(title)")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct GameLevel_Previews: PreviewProvider {
    static var previews: some View {
        GameLevel(title: "EASY", attempts: 10, backgroundColor: .easy)
    }
}
