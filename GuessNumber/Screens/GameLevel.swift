//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct GameLevel: View {
    let title: String
    var attempts: Int
    let backgroundColor: Screen
    
    @State private var userNumber = 0
    @State private var userInput: Int?
    @State private var secretNumber = Int.random(in: 1...100)
    @FocusState var isInputActive: Bool
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertButtonTitle = ""
    @State private var alertMessage = ""
    @State private var scoreTitle = ""
//    @State private var alertLose = false
//    @State private var alertWin = false
//    @State private var alertError = false

   
    
  
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackgroundView(screen: backgroundColor)
                    
                    VStack {
                        TextFrameView(textFirstLine: "\(title)".uppercased(), textSecondLine: "ATTEMPTS: \(attempts)")
                        
//                        LazyVGrid(columns: ColumnAttempts().column) {
//                            ForEach(userAttempts, id: \.self) { item in
//                                AttemptFrameView(chooseNumber: item)
//                            }
//                        }
                        
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
                                        userNumber = userInput ?? 0
                                        isInputActive.toggle()
                                        showAlert = true
                                        
                                    }
                                }
                            }
                        
                    // MARK: Score alert
//                            .alert(scoreTitle, isPresented: $showAlert) {
//                                Button("Continue", role: .none) { }
//                            } message: {
//                                Text("Try again!")
//                            }
                        
                        // MARK: One alert
                            .alert(scoreTitle, isPresented: $showAlert) {
                                Button("Play again", role: .none) {
//                                    playAgain()
                                }
                            } message: {
                                Text("\(alertMessage)")
                            }
                        
                        
                        // MARK: Lose alert
//                            .alert(scoreTitle, isPresented: $alertLose) {
//                                Button("Play again", role: .none) {
////                                    playAgain()
//                                }
//                            } message: {
//                                Text("The secret number is \(secretNumber).")
//                            }
                        
                        // MARK: Win alert
//                            .alert(scoreTitle, isPresented: $alertWin) {
//                                Button("Play again", role: .none) {
////                                    playAgain()
//                                }
//                            } message: {
//                                Text("Congratulations! \n The secret number is \(secretNumber).")
//                            }
                        
                        // MARK: Error alert
//                            .alert("ERROR", isPresented: $alertError) {
//                                Button("Try again", role: .none) { }
//                            } message: {
//                                Text(scoreTitle)
//                            }
                        
                        Spacer()
                    } //: VSTACK
                    .padding(.horizontal, 20)
                } //: ZSTACK
                //                .navigationTitle("LEVEL: \(title)")
                //                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    
//    func addNumberToArray() {
//        userAttempts.append(userInput ?? 0)
//    }
    
    mutating func play() {
        if userNumber >= 1 && userNumber <= 100 {
            attempts -= 1
            if userNumber == secretNumber {
                scoreTitle = "🏆 YOU WIN 🏆"
                alertButtonTitle = "Play again"
                alertMessage = "Congratulations! \n The secret number is \(secretNumber)."
            } else if attempts == 0 {
                scoreTitle = "👎 YOU LOSE 👎"
                alertButtonTitle = "Play again"
                alertMessage = "The secret number is \(secretNumber)."
                
            } else if userNumber > secretNumber {
                scoreTitle = "❌ TOO HIGH ⬆️"
                alertMessage = "TOO HIGH"
                
            } else if userNumber < secretNumber {
                scoreTitle = "❌ TOO LOW ⬇️"
                alertMessage = "TOO LOW"
            }
        } else {
            scoreTitle = "Invalid input"
            alertMessage = "Invalid input"
        }
    }
        
    mutating func playAgain() {
            attempts = 10
            userNumber = 0
        }
    }
    
  


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
        GameLevel(title: "EASY", attempts: 10, backgroundColor: .easy)
    }
}
