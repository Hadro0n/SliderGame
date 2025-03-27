//
//  SliderGameViewViewModel.swift
//  SliderGame
//
//  Created by Владислав Якунин on 27.03.2025.
//

import Foundation
import Observation

@Observable final class SliderGameViewViewModel {
    var settings = Settings()
    var alertIsPresented = false
    
    var score: Int {
        100 - abs(settings.targetValue - lround(settings.currentValue))
    }
    
    var currentAlpha: Double {
        Double(score) / 100
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func reset() {
        settings.currentValue = Double.random(in: 0...100)
        settings.targetValue = Int.random(in: 0...100)
    }
}
