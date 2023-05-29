//
//  ContentView.swift
//  first_project
//
//  Created by Daniel Jorge on 22/05/23.
//

import SwiftUI

enum CalculatorMode {
    case notSet
    case addition
    case subtraction
    case multiplication
}

struct ContentView: View {
    @State var currentValue = "0"
    @State var previousValue = "0"
    @State var currentMode: CalculatorMode = .notSet
    @State var lastButtonWasMode = false
    @State var lastValueWritten = "0"
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                TotalText(value: currentValue)
                HStack {
                    CalculatorButton(buttonText: "7", action: didPressNumber)
                    CalculatorButton(buttonText: "8", action: didPressNumber)
                    CalculatorButton(buttonText: "9", action: didPressNumber)
                    CalculatorButton(buttonText: "x", buttonColor: .orange, action: didPressMode, mode: .multiplication)
                }
                HStack {
                    CalculatorButton(buttonText: "4", action: didPressNumber)
                    CalculatorButton(buttonText: "5", action: didPressNumber)
                    CalculatorButton(buttonText: "6", action: didPressNumber)
                    CalculatorButton(buttonText: "-", buttonColor: .orange, action: didPressMode, mode: .subtraction)
                }
                HStack {
                    CalculatorButton(buttonText: "1", action: didPressNumber)
                    CalculatorButton(buttonText: "2", action: didPressNumber)
                    CalculatorButton(buttonText: "3", action: didPressNumber)
                    CalculatorButton(buttonText: "+", buttonColor: .orange, action: didPressMode, mode: .addition)
                }
                HStack {
                    CalculatorButton(buttonText: "0", width: 148, action: didPressNumber)
                    CalculatorButton(buttonText: "C", buttonColor: Color(red: 0.4, green: 0.4, blue: 0.4), action: didPressClear)
                    CalculatorButton(buttonText: "=", buttonColor: .orange, action: didPressEquals)
                }
            }
        }.ignoresSafeArea()
    }
    
    func didPressNumber(button: CalculatorButton) {
        if (lastButtonWasMode) {
            currentValue = "0"
        }
        if let parseValue = Int(currentValue + button.buttonText) {
            currentValue = "\(parseValue)"
            lastValueWritten = currentValue
        }
        else {
            currentValue = "Error"
        }
        lastButtonWasMode = false
    }
    
    func didPressMode(button: CalculatorButton) {
        if (lastButtonWasMode){
            return
        }
        if (currentMode != .notSet) {
            calculateResult()
        }
        currentMode = button.mode
        previousValue = currentValue
        lastButtonWasMode = true
    }
    
    func didPressClear(button: CalculatorButton) {
        lastButtonWasMode = true
        if (currentValue == "0") {
            previousValue = "0"
            currentMode = .notSet
        }
        currentValue = "0"
    }
    
    func didPressEquals(button: CalculatorButton) {
        lastButtonWasMode = true
        calculateResult()
    }
    
    func calculateResult(){
        var result: Int = 0
        if ((Int(currentValue) != nil) && (Int(previousValue) != nil)) {
            switch currentMode {
            case .notSet:
                return
            case .addition:
                result = Int(previousValue)! + Int(lastValueWritten)!
            case .subtraction:
                result = Int(previousValue)! - Int(lastValueWritten)!
            case .multiplication:
                result = Int(previousValue)! * Int(lastValueWritten)!
            }
            currentValue = "\(result)"
            previousValue = currentValue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
