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
                            attempts = 10
                            secretNumber = Int.random(in: 1...100)
                            tappedEasy.toggle()
                        } label: {
                            ButtonText(designation: "Easy")
                              
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .tint(.yellow)
                        .controlSize(.small)
                        .font(.title)
                        .shadow(radius: 10)
                        .padding(.bottom, 5)
                        .rotation3DEffect(.degrees(tappedEasy == true ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                        .animation(.default, value: tappedEasy)
                        
                        Spacer()
                        
                        Button() {
                            attempts = 5
                            secretNumber = Int.random(in: 1...100)
                            tappedHard.toggle()
                        } label: {
                            ButtonText(designation: "Hard")
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .tint(.orange)
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

                    Text("\(secretNumber)")
                        .foregroundColor(.white)
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
                        .keyboardType(.decimalPad)
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
                    
                        .alert("ERROR", isPresented: $alertError) {
                            Button("Continue", role: .none) { }
                        } message: {
                            Text(scoreTitle)
                        }
                    
                    
                }
            }.ignoresSafeArea()//end ZSTACK
        }.edgesIgnoringSafeArea(.all)//end GEOMETRY
    }//end BODY
    
    func play() {
        if attempts == 0 {
            showAlert = false
            alertLose = true
            scoreTitle = "👎 YOU LOSE 👎"
        } else if userNumber == nil {
            showAlert = false
            alertError = true
            scoreTitle = "You must enter a number\n from 1 to 100."
            attempts -= 1
        } else if userNumber > 100 || userNumber == 0 {
            showAlert = false
            alertError = true
            scoreTitle = "This number is out of range.\n Enter a number from 1 to 100."
            attempts -= 1
        } else if userNumber > secretNumber {
            scoreTitle = "❌ TOO HIGH ⬆️"
            attempts -= 1
        } else if userNumber < secretNumber {
            scoreTitle = "❌ TOO LOW ⬇️"
            attempts -= 1
        } else if userNumber == secretNumber {
            showAlert = false
            alertWin = true
            scoreTitle = "🏆 YOU WIN 🏆"
        }
    }
    
    func playAgain() {
        attempts = 10
        userNumber = 0
    }
    
}//end STRUCT



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(attempts: 2)
    }
}
