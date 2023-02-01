//
//  Templates.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//

import SwiftUI

struct Templates: View {
    var body: some View {
        RadialGradient(stops: [
            .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
            .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
                       center: .top, startRadius: 200, endRadius: 600)
        .ignoresSafeArea()
    }
}


struct ButtonText: View {
    let designation: String
    
    var body: some View {
        Text(designation)
            .padding(.horizontal,15.0)
            .padding(.vertical,13)
    }
}

struct DesignButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.borderedProminent)
            .foregroundColor(.black)
            .padding(5)
            .tint(.yellow)
            .controlSize(.large)
            .font(.title)
            .shadow(radius: 5)
            //.rotation3DEffect(Angle(degrees: 90.0), axis: (x: 0, y: 1, z: 0))
//            .clipShape(Capsule())
//            .background(Color.yellow)
//            .foregroundColor(.black)
//            .padding(10)
//            .tint(.yellow)
//            .controlSize(.large)
//            .font(.title)
//            .shadow(radius: 5)
        
    }
}
    

struct Templates_Previews: PreviewProvider {
    static var previews: some View {
        Templates()
    }
}
