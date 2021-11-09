//
//  ButtonView.swift
//  GuessNumberPosition
//
//  Created by Aiza on 09.11.2021.
//

import SwiftUI

struct ButtonView: View {
    let opacity: Double
    @Binding var showAlert: Bool
    @Binding var targetValue: Int
    
    var body: some View {
        VStack(spacing: 30) {
            Button(action: { showAlert.toggle() }) {
                Text("Проверь меня!")
            }
            .alert(Text("Ваш счет \(lround(opacity * 100)) из 100"),
                   isPresented: $showAlert) {}
            
            Button(action: {targetValue = Int.random(in: 0...100) }) {
                Text("Начать заново")
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(opacity: 0.1, showAlert: .constant(false), targetValue: .constant(1))
    }
}
