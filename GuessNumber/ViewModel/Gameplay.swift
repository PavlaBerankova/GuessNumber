//
//  Gameplay.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 03.07.2023.
//

import SwiftUI

class Gameplay {
    
    @State private var attempts = 10
    @State private var userInput: Int!
    @State private var secretNumber = Int.random(in: 1...100)
    @FocusState var isInputActive: Bool
    
    @State private var showAlert = false
    @State private var alertButtonTitle = ""
    @State public var alertMessage = ""
    @State private var alertTitle = AlertTitle(rawValue: AlertTitle.error.rawValue)
    
    func playing() {
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


