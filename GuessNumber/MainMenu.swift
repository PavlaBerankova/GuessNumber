//
//  MainMenu.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//

import SwiftUI

struct MainMenu: View {
    @State private var isClickOnButton = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Templates()
                
                VStack {
                    
                    Spacer()
                    
                    Group {
                        Text("Guess the Number")
                        Text("1 ~ 100")
                    }
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding(5)
                    
                    Spacer()
                    
                    Text("Choose difficult")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    HStack {
                        Spacer()
                        Spacer()
                        
                        NavigationLink(destination: Game(difficult: "EASY", attempts: 10), isActive: $isClickOnButton) { EmptyView() }
                        
                        Button() {
                            self.isClickOnButton = true
                        } label: {
                            ButtonText(designation: "Easy")
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .padding(10)
                        .tint(.yellow)
                        .controlSize(.large)
                        .font(.title)
                        .shadow(radius: 10)
                        
                        
                        
                        NavigationLink {
                            Game(difficult: "HARD", attempts: 5)
                        } label: {
                            ButtonText(designation: "Hard")
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .padding(10)
                        .tint(.orange)
                        .controlSize(.large)
                        .font(.title)
                        .shadow(radius: 5)
                        
                        Spacer()
                        Spacer()
                    }
                    
                    Spacer()
                    Spacer()
                    
                }
            }
        } // end navigationView
    }// end body
}// end struct



struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
