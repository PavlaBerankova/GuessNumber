//
//  TextFieldView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.07.2023.
//

import SwiftUI

struct TextFieldView: View {
    @State var userInput: Int!
    
    var body: some View {
        VStack {
            TextField("Number: 1 - 100", value: $userInput, format: .number)
//            TextField("Number: 1 - 100", text: $textFieldText)
                .font(.title)
                .padding([.leading, .trailing], 10)
                .foregroundColor(.black)
                .frame(width: 250, height: 100)
                .background(Color.white.opacity(0.7).cornerRadius(10))
                
                
        }
        .padding(.horizontal, 20)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .easy)
            VStack {
                TextFieldView()
            }
        }
    }
}
