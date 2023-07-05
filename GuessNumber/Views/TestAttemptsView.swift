//
//  TestAttemptsView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 05.07.2023.
//

import SwiftUI

struct TestAttemptsView: View {
    var firstTitle1: String
    var secondTitle1: String
    var thirdTitle1: String?
    var colorText1 = Color("background2")
    var colorFrame1 = Color(.white)
    
    var body: some View {
        VStack {
            HStack {
                Text(firstTitle1)
                Text(secondTitle1).bold()
                Text(thirdTitle1 ?? "").bold()
            }
            .font(.title2)
            .foregroundColor(colorText1)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(colorFrame1)
                    .shadow(color: Color(.black).opacity(0.6), radius: 10)
            )
            
        }
    }
}


struct TestAttemptsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView(screen: .hard)
            
            VStack {
                TestAttemptsView(firstTitle1: "TOTAL", secondTitle1: "ATTEMPTS:", thirdTitle1: "10")
            }
            .padding(.horizontal, 40)
        }
        
    }
}



    
