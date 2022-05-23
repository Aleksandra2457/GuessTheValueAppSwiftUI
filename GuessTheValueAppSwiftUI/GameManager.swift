//
//  GameManager.swift
//  GuessTheValueAppSwiftUI
//
//  Created by Александра Лесовская on 23.05.2022.
//

import SwiftUI
import Combine

class GameManager: ObservableObject {

    @Published var guessedValue = Int.random(in: 0...100) 
    
    func computeScore(usersValue: Float) -> Int {
        let difference = abs(guessedValue - lroundf(usersValue))
        return 100 - difference
    }
    
}
