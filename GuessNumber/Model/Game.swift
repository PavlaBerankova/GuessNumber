import SwiftUI

enum Difficult {
    case easy
    case hard
    
    var title: String {
        switch self {
        case .easy:
            return "EASY"
        case .hard:
            return "HARD"
        }
    }
    
    var attempts: Int {
        switch self {
        case .easy:
            return 10
        case .hard:
            return 5
        }
    }
}

enum AlertTitle: String {
    case empty = ""
    case error = "ERROR"
    case win = "🏆 YOU WIN 🏆"
    case lose = "👎 YOU LOSE 👎"
    case high = "❌ TOO HIGH ⬆️"
    case low = "❌ TOO LOW ⬇️"
}


// Computed properties
struct TestGame {
    var difficult: String
    var attempts: Int {
        switch difficult {
        case "easy":
            return 10
        case "hard":
            return 5
        default:
            return 10
        }
    }
}
