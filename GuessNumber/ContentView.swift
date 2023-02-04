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
    
    
//    GeometryReader { geometry in
//      VStack {
//        // další kód
//      }
//      .padding(.bottom, geometry.safeAreaInsets.bottom)
//    }
    
    
    var body: some View {
        //MARK: background
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.4),
                .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 600)
            .ignoresSafeArea()
            
            //MARK: Text intro
            GeometryReader { geometry in
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
                    Text("Attemtps: \(attempts)")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding(.bottom, 40)
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
                    
                }.padding(.bottom, geometry.safeAreaInsets.bottom)
            }
        }//end ZSTACK
    }//end BODY
    
    func play() {
        
    }
    
}//end STRUCT



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(attempts: 2)
    }
}
