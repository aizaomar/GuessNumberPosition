//
//  ContentView.swift
//  GuessNumberPosition
//
//  Created by Aiza on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentValue: Double = 50
    @State private var targetValue: Int = 35
    
    @State private var showAlert =  false
    
    var body: some View {
        VStack{
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
//             UIKit Slider .........$currentValue, $target bla bla...
            
          // вынести кнопки
            VStack(spacing: 30) {
                Button(action: checkValue) {
                    Text("Проверь меня")
                }
                .alert(Text("Ваш счет \(computeScore()) из 100"), isPresented: $showAlert) {
                }
                Button(action: restartGame) {
                    Text("Начать заново")
                }
            }
            
        }.padding()
    }
    
    private func checkValue() {
        showAlert.toggle()
    }
    
    private func restartGame() {
        targetValue = Int.random(in: 0...100)
    }
    
    private func computeScore() -> Int {
        let difference  = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


