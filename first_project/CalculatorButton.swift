//
//  CalculatorButton.swift
//  first_project
//
//  Created by Daniel Jorge on 22/05/23.
//

import SwiftUI

struct CalculatorButton: View {
    var buttonText: String = "1"
    var buttonColor: Color = Color(red: 0.2, green: 0.2, blue: 0.2)
    var width: CGFloat = 70.0
    var action: (CalculatorButton) -> Void = {_ in}
    var mode: CalculatorMode = .notSet
    var body: some View {
        Button{
            action(self)
        } label: {
            Text(buttonText)
                .fontWeight(.semibold)
                .font(.title)
                .frame(width: width, height: 70.0, alignment: .center)
                .background(buttonColor)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 35))
        }
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
