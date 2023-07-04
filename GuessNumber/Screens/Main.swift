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
    let backgroundColor: Screen
    
    var body: some View {
        NavigationStack {
                ZStack {
                    BackgroundView(screen: .menu)
                    VStack {
                        TextFrameView(textFirstLine: "Guess the Number", textSecondLine: "🎲 1 ~ 100")
                        
                        VStack(spacing: 30) {
                            NavigationLink {
                                Level(title: easy.title, attempts: easy.attempts, backgroundColor: .easy)
                            } label: {
                                LevelButtonsView(title: easy.title, colorText: Color("background2"))
                            }
                            
                            NavigationLink {
                                Level(title: hard.title, attempts: hard.attempts, backgroundColor: .hard)
                            } label: {
                                LevelButtonsView(title: hard.title, colorText: Color("background2"))
                            }
                        }
                      
                        } //: VSTACK
                    .padding(.horizontal, 20)
                        } //: ZSTACK
                .ignoresSafeArea()
                } //: NAVIGATIONSTACK
            } //: BODY
        }
   
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//            Background()
//
//                //MARK: Text intro
//                VStack {
//                    Spacer()
//                    Group {
//                        Text("Guess the number")
//                        Text("🎲 1 ~ 100")
//                    }
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//
//
//                    //MARK: Difficult
//                    HStack {
//                        Spacer()
//                        Button() {
//                            attempts = 10
//                            secretNumber = Int.random(in: 1...100)
//                            tappedEasy.toggle()
//                        } label: {
//                            ButtonText(designation: "Easy")
//
//                        }
//                        .buttonStyle(.borderedProminent)
//                        .foregroundColor(.black)
//                        .tint(.yellow)
//                        .controlSize(.small)
//                        .font(.title)
//                        .shadow(radius: 10)
//                        .padding(.bottom, 5)
//                        .rotation3DEffect(.degrees(tappedEasy == true ? 360 : 0), axis: (x: 0, y: 1, z: 0))
//                        .animation(.default, value: tappedEasy)
//
//                        Spacer()
//
//                        Button() {
//                            attempts = 5
//                            secretNumber = Int.random(in: 1...100)
//                            tappedHard.toggle()
//                        } label: {
//                            ButtonText(designation: "Hard")
//                        }
//                        .buttonStyle(.borderedProminent)
//                        .foregroundColor(.black)
//                        .tint(.orange)
//                        .controlSize(.small)
//                        .font(.title)
//                        .shadow(radius: 10)
//                        .padding(.bottom, 5)
//                        .rotation3DEffect(.degrees(tappedHard == true ? 360 : 0), axis: (x: 0, y: 1, z: 0))
//                        .animation(.default, value: tappedHard)
//
//                        Spacer()
//
//                    }
//
//                    //MARK: Attempts
//                    Group {
//                        Text("Attempts:")
//                        Text("\(attempts)")
//                    }
//                        .foregroundColor(.white)
//                        .font(.title2)
////                    Text("\(secretNumber)")
////                        .foregroundColor(.white)
//                    Spacer()
//
//                    //MARK: User input
//                    TextField("1~100",value: $userNumber, format: .number)
//                        .frame(width: 80, height: 40)
//                        .padding()
//                        .background(.regularMaterial)
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .font(.title)
//                        .focused($isInputActive)
//                        .shadow(radius: 5)
//                        .keyboardType(.numberPad)
//                        .toolbar {
//                            ToolbarItemGroup(placement: .keyboard) {
//                                Spacer()
//
//                                Button("Done") {
//                                    isInputActive = false
//                                    showAlert = true
//                                    play()
//                                }
//                            }
//                        }
//                    Spacer()
//                    Spacer()
//                    Spacer()
//                    Spacer()
//
//
//                //MARK: Score alert
//                        .alert(scoreTitle, isPresented: $showAlert) {
//                            Button("Continue", role: .none) { }
//                        } message: {
//                            Text("Try again!")
//                        }
//
//
//                    // MARK: Lose alert
//                        .alert(scoreTitle, isPresented: $alertLose) {
//                            Button("Play again", role: .none) {
//                                playAgain()
//                            }
//                        } message: {
//                            Text("The secret number is \(secretNumber).")
//                        }
//
//                    // MARK: Win alert
//                        .alert(scoreTitle, isPresented: $alertWin) {
//                            Button("Play again", role: .none) {
//                                playAgain()
//                            }
//                        } message: {
//                            Text("Congratulations! \n The secret number is \(secretNumber).")
//                        }
//
//                    // MARK: Error alert
//                        .alert("ERROR", isPresented: $alertError) {
//                            Button("Try again", role: .none) { }
//                        } message: {
//                            Text(scoreTitle)
//                        }
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



struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        Main(backgroundColor: .menu)
    }
}
