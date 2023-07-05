//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct Level: View {
    @State var level: String
    @State var attempts: Int
    var backgroundColor: Screen
//    var game = Gameplay()
    
    init(level: String, attempts: Int) {
        self.level = level
        self.attempts = attempts
        if level == "EASY" {
            self.backgroundColor = .easy
        } else {
            self.backgroundColor = .hard
        }
    }
    
    //    @State private var userNumber = 0
    @State private var userInput: Int?
    @State private var secretNumber = Int.random(in: 1...100)
    @FocusState var isInputActive: Bool
    
    @State private var showAlert = false
    @State private var alertButtonTitle = ""
    @State public var alertMessage = ""
    @State private var alertTitle = ""
    //    @State private var alertLose = false
    //    @State private var alertWin = false
    //    @State private var alertError = false
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackgroundView(screen: backgroundColor)
                    
                    VStack {
                        TextFrameView(textFirstLine: "\(level)".uppercased(), textSecondLine: "ATTEMPTS: \(attempts)")
                        
                        Text("\(secretNumber)")
                            .foregroundColor(.white)
                        
                        TextField("1 ~ 100", value: $userInput, format: .number)
                            .font(.title)
                            .padding([.leading, .trailing], 10)
                            .foregroundColor(.black)
                            .frame(width: 110, height: 50)
                        
                            .background(Color.white).cornerRadius(10)
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
                        
                        // MARK: Score alert
                        //                            .alert(scoreTitle, isPresented: $showAlert) {
                        //                                Button("Continue", role: .none) { }
                        //                            } message: {
                        //                                Text("Try again!")
                        //                            }
                        
                        // MARK: Alert
                            .alert(alertTitle, isPresented: $showAlert) {
                                Button(alertButtonTitle, role: .none) {
                                    if alertTitle == "🏆 YOU WIN 🏆" || alertTitle == "👎 YOU LOSE 👎" {
                                        playAgain(level)
                                    }
                                }
                            } message: {
                                Text("\(alertMessage)")
                            }
                        Spacer()
                    } //: VSTACK
                    .padding(.horizontal, 20)
                } //: ZSTACK
            }
        }
    }
    
    func play() {
        guard userInput != nil else {
            alertTitle = "ERROR!"
            alertMessage = "You must write number 1-100."
            alertButtonTitle = "Try again"
            return
        }
        
        if let userInput = userInput { //userInput >= 1 && userInput <= 100 || (userInput < 1 || userInput > 100) {
            attempts -= 1
            if userInput == secretNumber {
                alertTitle = "🏆 YOU WIN 🏆"
                alertMessage = "Congratulations! \n The secret number is \(secretNumber)."
                alertButtonTitle = "Play again"
            } else if attempts == 0 {
                alertTitle = "👎 YOU LOSE 👎"
                alertMessage = "The secret number is \(secretNumber)."
                alertButtonTitle = "Play again"
                
            } else if userInput > secretNumber {
                alertTitle = "❌ TOO HIGH ⬆️"
                alertMessage = ""
                alertButtonTitle = "Try again"
                
            } else if userInput < secretNumber {
                alertTitle = "❌ TOO LOW ⬇️"
                alertMessage = ""
                alertButtonTitle = "Try again"
            } else {
                alertTitle = "ERROR"
                alertMessage = "The number is out of range."
                alertButtonTitle = "Try again"
            }
        }
    }
    
    func playAgain(_ level: String) {
        secretNumber = Int.random(in: 1...100)
        if level == "EASY" {
            self.attempts = 10
            userInput = 0
        } else {
            self.attempts = 5
            userInput = 0
            self.secretNumber = secretNumber
        }
    }
}




//        if userNumber >= 1 && userNumber <= 100 {
//            attempts -= 1
//            if userNumber == secretNumber {
//                scoreTitle = "🏆 YOU WIN 🏆"
//                alertButtonTitle = "Play again"
//                alertMessage = "Congratulations! \n The secret number is \(secretNumber)."
//            } else if attempts == 0 {
//                scoreTitle = "👎 YOU LOSE 👎"
//                alertButtonTitle = "Play again"
//                alertMessage = "The secret number is \(secretNumber)."
//
//            } else if userNumber > secretNumber {
//                scoreTitle = "❌ TOO HIGH ⬆️"
//                alertMessage = "TOO HIGH"
//
//            } else if userNumber < secretNumber {
//                scoreTitle = "❌ TOO LOW ⬇️"
//                alertMessage = "TOO LOW"
//            }
//        } else {
//            scoreTitle = "Invalid input"
//            alertMessage = "Invalid input"
//        }
//    }

//    mutating func playAgain() {
//            attempts = 10
//            userNumber = 0
//        }
//    }




//
//
//
//
//
//                }
//            }.ignoresSafeArea()//end ZSTACK
//        }.edgesIgnoringSafeArea(.all)//end GEOMETRY
//    }//end BODY
//
//
//    func play() {
//        if let userNumber = userNumber, userNumber >= 1 && userNumber <= 100 {
//            attempts -= 1
//            if userNumber == secretNumber {
//                showAlert = false
//                scoreTitle = "🏆 YOU WIN 🏆"
//                alertWin = true
//            } else if attempts == 0 {
//                showAlert = false
//                scoreTitle = "👎 YOU LOSE 👎"
//                alertLose = true
//            } else if userNumber > secretNumber {
//                scoreTitle = "❌ TOO HIGH ⬆️"
//
//            } else if userNumber < secretNumber {
//                scoreTitle = "❌ TOO LOW ⬇️"
//
//            }
//        } else {
//            showAlert = false
//            alertError = true
//            scoreTitle = "Invalid input"
//
//        }
//    }
//
//    func playAgain() {
//        attempts = 10
//        userNumber = 0
//    }
//}


struct GameLevel_Previews: PreviewProvider {
    static var previews: some View {
        Level(level: "HARD", attempts: 5)
    }
}
