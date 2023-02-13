//
//  ContentView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//


import SwiftUI

struct ContentView: View {
    @State private var userNumber: Int!
    @State public var attempts = 10
    
    @State private var secretNumber = Int.random(in: 1...100)
    
    @FocusState var isInputActive: Bool
    @State private var showAlert = false
    @State private var alertLose = false
    @State private var alertWin = false
    @State private var alertError = false
    @State private var scoreTitle = ""
    @State private var tappedEasy = false
    @State private var tappedHard = false
    
    @State private var buttonClickYellowEasy = false
    @State private var buttonClickOrangeHard = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
            Background()
                
                //MARK: Text intro
                VStack {
                    Spacer()
                    Group {
                        Text("Guess the number")
                        Text("🎲 1 ~ 100")
                    }
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                    
                    //MARK: Difficult
                    HStack {
                        Spacer()
                        Button() {
                            buttonClickYellowEasy.toggle()
                            buttonClickOrangeHard = false
                            attempts = 10
                            secretNumber = Int.random(in: 1...100)
                            tappedEasy.toggle()
                        } label: {
                            ButtonText(designation: "Easy")
                              
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .tint(buttonClickYellowEasy ? .yellow : .white)
                        .controlSize(.small)
                        .font(.title)
                        .shadow(radius: 10)
                        .padding(.bottom, 5)
                        .rotation3DEffect(.degrees(tappedEasy == true ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.default, value: tappedEasy)
                        
                        Spacer()
                        
                        Button() {
                            buttonClickOrangeHard.toggle()
                            buttonClickYellowEasy = false
                            attempts = 5
                            secretNumber = Int.random(in: 1...100)
                            tappedHard.toggle()
                        } label: {
                            ButtonText(designation: "Hard")
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .tint(buttonClickOrangeHard ? .orange : .white)
                        .controlSize(.small)
                        .font(.title)
                        .shadow(radius: 10)
                        .padding(.bottom, 5)
                        .rotation3DEffect(.degrees(tappedHard == true ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.default, value: tappedHard)
                        
                        Spacer()
                        
                    }
                    
                    //MARK: Attempts
                    Group {
                        Text("Attempts:")
                        Text("\(attempts)")
                    }
                        .foregroundColor(.white)
                        .font(.title2)
//                    Text("\(secretNumber)")
//                        .foregroundColor(.white)
                    Spacer()
                    
                    //MARK: User input
                    TextField("1~100",value: $userNumber, format: .number)
                        .frame(width: 80, height: 40)
                        .padding()
                        .background(.regularMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .font(.title)
                        .focused($isInputActive)
                        .shadow(radius: 5)
                        .keyboardType(.numberPad)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                
                                Button("Done") {
                                    isInputActive = false
                                    showAlert = true
                                    play()
                                }
                            }
                        }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
              
                    
                //MARK: Score alert
                        .alert(scoreTitle, isPresented: $showAlert) {
                            Button("Continue", role: .none) { }
                        } message: {
                            Text("Try again!")
                        }
                    
                    
                    // MARK: Lose alert
                        .alert(scoreTitle, isPresented: $alertLose) {
                            Button("Play again", role: .none) {
                                playAgain()
                            }
                        } message: {
                            Text("The secret number is \(secretNumber).")
                        }
                    
                    // MARK: Win alert
                        .alert(scoreTitle, isPresented: $alertWin) {
                            Button("Play again", role: .none) {
                                playAgain()
                            }
                        } message: {
                            Text("Congratulations! \n The secret number is \(secretNumber).")
                        }
                    
                    // MARK: Error alert
                        .alert("ERROR", isPresented: $alertError) {
                            Button("Try again", role: .none) { }
                        } message: {
                            Text(scoreTitle)
                        }
                    
                    
                }
            }.ignoresSafeArea()//end ZSTACK
        }.edgesIgnoringSafeArea(.all)//end GEOMETRY
    }//end BODY
    

    func play() {
        if let userNumber = userNumber, userNumber >= 1 && userNumber <= 100 {
            attempts -= 1
            if userNumber == secretNumber {
                showAlert = false
                scoreTitle = "🏆 YOU WIN 🏆"
                alertWin = true
            } else if attempts == 0 {
                showAlert = false
                scoreTitle = "👎 YOU LOSE 👎"
                alertLose = true
            } else if userNumber > secretNumber {
                scoreTitle = "❌ TOO HIGH ⬆️"
               
            } else if userNumber < secretNumber {
                scoreTitle = "❌ TOO LOW ⬇️"
               
            }
        } else {
            showAlert = false
            alertError = true
            scoreTitle = "Invalid input"
           
        }
    }

    func playAgain() {
        attempts = 10
        userNumber = 0
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(attempts: 2)
    }
}
