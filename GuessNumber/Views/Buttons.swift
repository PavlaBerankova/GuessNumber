//
//  Buttons.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 22.06.2023.
//

import SwiftUI

struct Buttons: View {
    let difficult: String
    let attempt: Int
    let color: Color?
    
    var body: some View {
        Text(difficult)
            .font(.title2)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons(difficult: "Easy", attempt: 10, color: .orange)
    }
}

