//
//  NumberRangeSlider.swift
//  GuessNumberPosition
//
//  Created by Aiza on 09.11.2021.
//

import SwiftUI

struct NumberRangeSlider: UIViewRepresentable {
    @Binding var value: Double
    @Binding var targetValue: Int
    @Binding var opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.tintColor = .black
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(red: 0,
                                        green: 200,
                                        blue: 0,
                                        alpha: CGFloat(opacity))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, targetValue: $targetValue, opacity: $opacity)
    }
}

extension NumberRangeSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        @Binding var targetValue: Int
        @Binding var opacity: Double
        
        init(value: Binding<Double>, targetValue: Binding<Int>, opacity: Binding<Double>) {
            _sliderValue = value
            _targetValue = targetValue
            _opacity = opacity
        }
        
        @objc func changeSlider(_ slider: UISlider) {
            sliderValue = Double(slider.value)
            opacity = setTumbOpacity()
        }
        
        private func setTumbOpacity() -> Double {
            let thumb = abs(targetValue - lround(sliderValue * 100))
            return 1 - Double(thumb) / Double(100)
        }
    }
}

struct UIKitSliderView_Previews: PreviewProvider {
    static var previews: some View {
        NumberRangeSlider(value: .constant(0.9), targetValue: .constant(75), opacity: .constant(0.9))
    }
}
