//
//  Templates.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//

import SwiftUI

struct Background: View {
    var body: some View {
        RadialGradient(stops: [
            .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
            .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
                       center: .top, startRadius: 200, endRadius: 650)
    }
}


struct ButtonText: View {
    let designation: String
    
    var body: some View {
        Text(designation)
            .font(.title2)
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
    }
}


struct Templates_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
