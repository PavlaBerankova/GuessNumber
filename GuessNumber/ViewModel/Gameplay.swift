//
//  Gameplay.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 03.07.2023.
//

import SwiftUI

class Gameplay {
    
    func playing(input: Int) {
        guard userInput != nil else {
            alertTitle = .error
            alertMessage = "You must write number 1-100."
            alertButtonTitle = "Try again"
            return
        }
        
        if let userInput = userInput { //userInput >= 1 && userInput <= 100 || (userInput < 1 || userInput > 100) {
            attempts -= 1
            if userInput == secretNumber {
                alertTitle = .win
                alertMessage = "Congratulations! \n The secret number is \(secretNumber)."
                alertButtonTitle = "Play again"
            } else if attempts == 0 {
                alertTitle = .lose
                alertMessage = "The secret number is \(secretNumber)."
                alertButtonTitle = "Play again"
                
            } else if userInput > secretNumber {
                alertTitle = .high
                alertMessage = ""
                alertButtonTitle = "Try again"
                
            } else if userInput < secretNumber {
                alertTitle = .low
                alertMessage = ""
                alertButtonTitle = "Try again"
            } else {
                alertTitle = .error
                alertMessage = "The number is out of range."
                alertButtonTitle = "Try again"
            }
        }
    }
    }
}

