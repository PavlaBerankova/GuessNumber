//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct Level: View {
    var backgroundColor: Screen
    
    init(level: String, attempts: Int) {
        self.level = level
        self.attempts = attempts
        if level == "EASY" {
            self.backgroundColor = .easy
        } else {
            self.backgroundColor = .hard
        }
    }
    
    @State var level: String
    @State var attempts: Int
    @State private var userInput: Int!
    @State private var secretNumber = Int.random(in: 1...100)
    @FocusState var isInputActive: Bool
    
    @State private var showAlert = false
    @State private var alertButtonTitle = ""
    @State public var alertMessage = ""
    @State private var alertTitle = AlertTitle(rawValue: AlertTitle.empty.rawValue)
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackgroundView(screen: backgroundColor)
                    
                    VStack(spacing: 20) {
                        // MARK: TEXT INTRO
                        TextIntroView(textFirstLine: "1 ~ 100", textSecondLine: "")
                        
                        // MARK: USER INPUT
                        TextField("Write number...", value: $userInput, format: .number)
                            .font(.title2)
                            .padding([.leading], 25)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(Color.white).cornerRadius(10)
                            .shadow(color: Color(.black).opacity(0.6), radius: 10)
                            .keyboardType(.numberPad)
                            .focused($isInputActive)
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button("Done") {
                                        isInputActive.toggle()
                                        showAlert = true
                                        play()
                                    }
                                }
                            }
                        
                        // MARK: TOTAL ATTEMPTS
                        TestAttemptsView(firstTitle1: "TOTAL", secondTitle1: "ATTEMPTS:", thirdTitle1: "\(attempts)")
                        
                        Spacer()
                        
                        // MARK: SECRET NUMBER - FOR TEST
                        // Text("\(secretNumber)")
                        //.foregroundColor(.white)
                        
                        // MARK: ALERT
                            .alert("\(alertTitle!.rawValue)", isPresented: $showAlert) {
                                Button(alertButtonTitle, role: .none) {
                                    if alertTitle == .win || alertTitle == .lose {
                                        playAgain(level)
                                    }
                                }
                            } message: {
                                Text("\(alertMessage)")
                            }
                    } //: VSTACK
                    .padding(.horizontal, 50)
                    .padding(.top, 40)
                } //: ZSTACK
            }
        }
    }
    
    // MARK: GAME FUNCTIONS
    func play() {
        guard userInput != nil else {
            alertTitle = .error
            alertMessage = "You must write number 1-100."
            alertButtonTitle = "Try again"
            return
        }
        
        if let userInput = userInput {
            attempts -= 1
            if userInput == secretNumber {
                alertTitle = .win
                alertMessage = "Congratulations! \n The secret number is \(secretNumber)."
                alertButtonTitle = "Play again"
            } else if attempts == 0 {
                alertTitle = .lose
                alertMessage = "The secret number is \(secretNumber)."
                alertButtonTitle = "Play again"
                
            } else if userInput > secretNumber {
                alertTitle = .high
                alertMessage = ""
                alertButtonTitle = "Try again"
                
            } else if userInput < secretNumber {
                alertTitle = .low
                alertMessage = ""
                alertButtonTitle = "Try again"
            } else {
                alertTitle = .error
                alertMessage = "The number is out of range."
                alertButtonTitle = "Try again"
            }
        }
    }
    
    func playAgain(_ level: String) {
        secretNumber = Int.random(in: 1...100)
        userInput = 0
        
        if level == "EASY" {
            self.attempts = 10
            self.userInput = 0
        } else {
            self.attempts = 5
            self.userInput = 0
            self.secretNumber = secretNumber
        }
    }
}


struct GameLevel_Previews: PreviewProvider {
    static var previews: some View {
        Level(level: "EASY", attempts: 10)
    }
}
