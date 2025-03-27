//
//  SliderView.swift
//  SliderGame
//
//  Created by Владислав Якунин on 27.03.2025.
//

import SwiftUI

struct SliderView: View {
    @Bindable var sliderViewVM: SliderGameViewViewModel
    
    let color: UIColor
    
    var body: some View {
        VStack {
            let targetValue = sliderViewVM.settings.targetValue
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $sliderViewVM.settings.currentValue,
                    currentAlpha: sliderViewVM.currentAlpha,
                    color: color
                )
                Text("100")
            }
            .padding()
        }
    }
}

#Preview {
    SliderView(sliderViewVM: SliderGameViewViewModel(), color: .red)
}
