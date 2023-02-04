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
    @State private var scoreTitle = ""
    
    var body: some View {
        //MARK: background
        GeometryReader { geometry in
            ZStack {
                RadialGradient(stops: [
                    .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
                    .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
                               center: .top, startRadius: 200, endRadius: 600)
                
                //MARK: Text intro
                
                VStack {
                    Spacer()
                    Group {
                        Text("Guess the number")
                        Text("1 ~ 100")
                    }
                    .font(.title)
                    .foregroundColor(.white)
                    
                    
                    //MARK: Difficult
                    HStack {
                        Spacer()
                        Button() {
                            attempts = 10
                            secretNumber = Int.random(in: 1...100)
                        } label: {
                            Text("Easy")
                                .font(.title2)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .tint(.white)
                        .controlSize(.small)
                        .font(.title)
                        .shadow(radius: 10)
                        .padding(.bottom, 5)
                        
                        Spacer()
                        
                        Button() {
                            attempts = 5
                            secretNumber = Int.random(in: 1...100)
                        } label: {
                            Text("Hard")
                                .font(.title2)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 5)
                        }
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.black)
                        .tint(.white)
                        .controlSize(.small)
                        .font(.title)
                        .shadow(radius: 10)
                        .padding(.bottom, 5)
                        
                        Spacer()
                        
                    }
                    
                    //MARK: Attempts
                    Text("Attempts: \(attempts)")
                        .foregroundColor(.white)
                        .font(.title2)
//                        .padding(.bottom, 40)
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
                            Button("Continue", role: .none) { }
                        } message: {
                            Text("The secret number is \(secretNumber).")
                        }
                    
                    // MARK: Win alert
                        .alert(scoreTitle, isPresented: $alertWin) {
                            Button("Continue", role: .none) { }
                        } message: {
                            Text("Congratulations! \n The secret number is \(secretNumber).")
                        }
                    
                    
                }
            }.ignoresSafeArea()//end ZSTACK
        }.edgesIgnoringSafeArea(.all)//end GEOMETRY
    }//end BODY
    
    func play() {
        attempts -= 1
        if attempts == 0 {
            showAlert = false
            alertLose = true
            scoreTitle = "YOU LOSE"
        } else if userNumber > secretNumber {
            scoreTitle = "TOO HIGH"
        } else if userNumber < secretNumber {
            scoreTitle = "TOO LOW"
        } else if userNumber == secretNumber {
            showAlert = false
            alertWin = true
            scoreTitle = "YOU WIN"
        }
    }
    
}//end STRUCT



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(attempts: 2)
    }
}
