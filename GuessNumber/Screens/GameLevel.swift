//
//  GameView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 30.06.2023.
//

import SwiftUI

struct GameLevel: View {
    let title: String
    let attempts: Int
    let backgroundColor: Screen
    
    @FocusState private var isInputActive: Bool
//    @State private var userNumber = 0
//    @State private var testNumber = "56"
    @State var userInput: Int!
    @State var userAttempts = [Int]()
        
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    BackgroundView(screen: backgroundColor)
                    
                    VStack {
                        TextFrameView(textFirstLine: "\(title)".uppercased(), textSecondLine: "ATTEMPTS: \(attempts)")
                        
                        LazyVGrid(columns: ColumnAttempts().column) {
                        ForEach(userAttempts, id: \.self) { item in
                                AttemptFrameView(chooseNumber: item)
                            }
                        }
                    
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
                                        userAttempts.append(userInput)
                                        isInputActive.toggle()
                                    }
                                }
                            }
                        
                        Spacer()
                    } //: VSTACK
                    .padding(.horizontal, 20)
                } //: ZSTACK
                //                .navigationTitle("LEVEL: \(title)")
                //                .navigationBarTitleDisplayMode(.large)
            }
        }
    }
    
    func addNumberToArray() {
        
    }
}

struct GameLevel_Previews: PreviewProvider {
    static var previews: some View {
        GameLevel(title: "EASY", attempts: 10, backgroundColor: .easy)
    }
}
