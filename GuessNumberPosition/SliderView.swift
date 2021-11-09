//
//  SliderView.swift
//  GuessNumberPosition
//
//  Created by Aiza on 09.11.2021.
//

import SwiftUI

struct SliderView: View {
    @Binding var opacity: Double
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    var body: some View {
        HStack{
            Text("0")
            
            NumberRangeSlider(
                value: $currentValue,
                targetValue: $targetValue,
                opacity: $opacity
            )
                .onChange(of: currentValue) { newValue in
                    currentValue = newValue
                }
            
            Text("100")
            
                .padding()
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(opacity: .constant(0.1), currentValue: .constant(0.1), targetValue: .constant(1))
    }
}
