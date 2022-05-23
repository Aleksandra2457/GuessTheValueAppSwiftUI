//
//  SliderView.swift
//  GuessTheValueAppSwiftUI
//
//  Created by Александра Лесовская on 23.05.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    // MARK: - Property Wrappers
    @EnvironmentObject var gameManager: GameManager
    @Binding var currentSliderValue: Float
    
    // MARK: - Public Properties
    let guessedValue: Int
    
    // MARK: - Public Methods
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        slider.minimumTrackTintColor = .black
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let alpha = convertDifferenceToAlpha(Int(currentSliderValue))
        
        uiView.value = Float(currentSliderValue)
        uiView.thumbTintColor = UIColor(red: 255, green: 0, blue: 0, alpha: alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentSliderValue)
    }
    
    // MARK: - Private Methods
    private func convertDifferenceToAlpha(_ value: Int) -> CGFloat {
        
        let difference = gameManager.computeScore(usersValue: currentSliderValue)
        
        switch difference {
        case 0...10: return 0.0
        case 11...20: return 0.1
        case 21...30: return 0.2
        case 31...40: return 0.3
        case 41...50: return 0.4
        case 51...60: return 0.5
        case 61...70: return 0.6
        case 71...80: return 0.7
        case 81...90: return 0.8
        case 91...95: return 0.9
        default:
            return 1
        }
    }
    
}

extension SliderView {
    
    // MARK: - Coordinator Class
    class Coordinator: NSObject {
        @Binding var value: Float

        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            value = sender.value
        }
        
    }
    
}



