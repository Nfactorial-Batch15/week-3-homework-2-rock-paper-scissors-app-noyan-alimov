//
//  constants.swift
//  rockPaperScissorsApp
//
//  Created by Noyan Alimov on 16/12/2021.
//

import Foundation
import SwiftUI

struct MyColors {
    static let white = Color.white
    static let purple = Color(red: 103/255, green: 80/255, blue: 164/255)
    static let lightBlue = Color(red: 243/255, green: 242/255, blue: 248/255)
    
    static let lightYellow = Color(red: 255/255, green: 204/255, blue: 0/255)
    static let darkYellow = Color(red: 255/255, green: 92/255, blue: 0/255)
    
    static let lightRed = Color(red: 255/255, green: 105/255, blue: 97/255)
    static let darkRed = Color(red: 253/255, green: 77/255, blue: 77/255)
    
    static let lightGreen = Color(red: 181/255, green: 238/255, blue: 155/255)
    static let darkGreen = Color(red: 36/255, green: 174/255, blue: 67/255)
}

enum PickModel: String, Equatable, Comparable {
    case rock = "rock"
    case paper = "paper"
    case scissors = "scissors"
    
    static func == (lhs: PickModel, rhs: PickModel) -> Bool {
        switch (lhs, rhs) {
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return true
        default:
            return false
        }
    }
    
    static func < (lhs: PickModel, rhs: PickModel) -> Bool {
        switch (lhs, rhs) {
        case (.rock, .paper),
            (.paper, .scissors),
            (.scissors, .rock):
            return true
        default:
            return false
        }
    }
    
    func getEmoji() -> String {
        switch self {
            case .rock: return "🗿"
            case .paper: return "📃"
            case .scissors: return "✂️"
        }
    }
}
