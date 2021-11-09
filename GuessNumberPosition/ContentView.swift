//
//  ContentView.swift
//  GuessNumberPosition
//
//  Created by Aiza on 08.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Double = 0.5
    @State private var targetValue: Int = 30
    @State private var opacity: Double = 1.0
    
    @State private var showAlert =  false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            SliderView(
                opacity: $opacity,
                currentValue: $currentValue,
                targetValue: $targetValue
            )
            ButtonView(
                opacity: opacity,
                showAlert: $showAlert,
                targetValue: $targetValue
            )
        }.padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
