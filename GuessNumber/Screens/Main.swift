//
//  ContentView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//


import SwiftUI

struct Main: View {
 
    let easy = Difficult.easy
    let hard = Difficult.hard
    let backgroundColor: Screen = .menu
    
    var body: some View {
        NavigationStack {
                ZStack {
                    BackgroundView(screen: .menu)
                    VStack {
                        TextIntroView(textFirstLine: "Guess the Number", textSecondLine: "🎲 1 ~ 100")
                        
                        VStack(spacing: 30) {
                            NavigationLink {
                                Level(level: easy.title, attempts: easy.attempts)
                            } label: {
                                GameButtonView(firstTitle: "LEVEL", secondTitle: easy.title)
                            }
                            
                            NavigationLink {
                                Level(level: hard.title, attempts: hard.attempts)
                            } label: {
                                GameButtonView(firstTitle: "LEVEL", secondTitle: hard.title)
                            }
                        }
                        } //: VSTACK
                    .padding(.horizontal, 20)
                        } //: ZSTACK
                .ignoresSafeArea()
                } //: NAVIGATIONSTACK
            } //: BODY
        }
   

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
