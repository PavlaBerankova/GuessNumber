//
//  Game.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//

import SwiftUI

struct Game: View {
    @State private var difficult: String
    @State private var attempts: Int
    @State private var userNumber: Int!
    @State private var secretNumber = Int.random(in: 1...100)
    
    @State private var isClickExit = false
    @State private var navLinkActive = false
    @State private var alertLose: Bool = false
    @State private var alertWin: Bool = false
    @State private var showingAlert: Bool = false
    @State private var scoreTitle: String = ""
    
    @FocusState var isInputActive: Bool
    
    init(difficult: String, attempts: Int) {
        self.difficult = difficult
        self.attempts = attempts
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Templates()
                
                VStack {
                    
                    Spacer()
                    
                    Group {
                        Text("\(difficult)")
                        Text("Attempts: \(attempts) ")
                            .opacity(0.7)
                            .font(.title)//.bold()
                    }
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                    .padding(5)
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        // MARK: User input
                        TextField("1~100",value: $userNumber, format: .number)
                            .frame(width: 80, height: 40)
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .font(.title)
                            .focused($isInputActive)
                            .shadow(radius: 5)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    
                                    Button("Done") {
                                        isInputActive = false
                                        showingAlert = true
                                        play()
                                    }
                                }
                            }
                    }
                    .keyboardType(.decimalPad)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
            }// end ZStack
           
                // MARK: Score alert
                .alert(scoreTitle, isPresented: $showingAlert) {
                    Button("Continue", role: .none) { }
                } message: {
                    Text("Try again!")
                }
                
                
                // MARK: Lose alert
                .alert(scoreTitle, isPresented: $alertLose) {
                    
                        Button("Play again") { }
                    
                    
                    Button("Exit", role: .cancel) {
                    }
                } message: {
                    Text("The secret number is \(secretNumber).")
                }
            
            
                // MARK: Win alert
                .alert(scoreTitle, isPresented: $alertWin) {
                    Button("Play again", role: .none) { }
                    Button("Exit", role: .cancel) { }
                } message: {
                    Text("Congratulations! \n The secret number is \(secretNumber).")
            }
        }// end navigationView
    }//end body
    
    func play() {
        attempts -= 1
        if attempts == 0 {
            showingAlert = false
            alertLose = true
            scoreTitle = "YOU LOSE"
        } else if userNumber > secretNumber {
            scoreTitle = "TOO HIGH"
        } else if userNumber < secretNumber {
            scoreTitle = "TOO LOW"
        } else if userNumber == secretNumber {
            showingAlert = false
            alertWin = true
            scoreTitle = "YOU WIN"
        }
    }
} //end struct



struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game(difficult: "Hard", attempts: 2)
    }
}
