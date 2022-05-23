//
//  ContentView.swift
//  GuessTheValueAppSwiftUI
//
//  Created by Александра Лесовская on 23.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var gameManager: GameManager
    
    @State private var currentValue: Float = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер как можно ближе к: \(gameManager.guessedValue)")
                .lineLimit(1)
                .allowsTightening(true)
            HStack {
                Text("0")
                SliderView(currentSliderValue: $currentValue, guessedValue: gameManager.guessedValue)
                Text("100")
            }
            ButtonView(text: "Проверь меня!", action: {})
            ButtonView(text: "Начать заново", action: {
                currentValue = 0.0
                gameManager.guessedValue = Int.random(in: 0...100)
            })
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(gameManager.guessedValue - lroundf(currentValue))
        return 100 - difference
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameManager())
    }
}
