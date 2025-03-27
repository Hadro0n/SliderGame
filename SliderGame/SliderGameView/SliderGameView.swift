//
//  ContentView.swift
//  SliderGame
//
//  Created by Владислав Якунин on 27.03.2025.
//

import SwiftUI

struct SliderGameView: View {
    @State private var sliderViewVM = SliderGameViewViewModel()
        
    var body: some View {
        VStack {
            SliderView(sliderViewVM: sliderViewVM, color: .red)
            
            Button("Проверь меня!", action: sliderViewVM.showAlert)
                .padding()
                .alert(
                    "Ваш результат",
                    isPresented: $sliderViewVM.alertIsPresented,
                    actions: {}
                ) {
                    Text(sliderViewVM.score.formatted())
                }
            
            Button("Начать заново", action: sliderViewVM.reset)
        }
    }
}

#Preview {
    SliderGameView()
}

