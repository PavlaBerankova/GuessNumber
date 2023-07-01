//
//  TextFieldView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.07.2023.
//

import SwiftUI

struct TextFieldView: View {
    let textFieldText: String
    
    var body: some View {
        Text(textFieldText)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textFieldText: "Number: 1-100")
    }
}
