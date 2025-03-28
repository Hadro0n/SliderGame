//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by Владислав Якунин on 27.03.2025.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Double
    
    let currentAlpha: Double
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.value = Float(value)
        view.thumbTintColor = color.withAlphaComponent(currentAlpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(23), currentAlpha: 0.2, color: .red)
}
