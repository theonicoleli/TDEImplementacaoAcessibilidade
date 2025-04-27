//
//  ContentView.swift
//  TDEImplementacaoAcessibilidade
//
//  Created by user276556 on 4/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var result: Double? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Soma")
                .font(.largeTitle)
                .accessibilityAddTraits(.isHeader)
            
            TextField("Número 1", text: $firstNumber)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibilityLabel("Primeiro número")
                .accessibilityHint("Insira o primeiro valor a ser somado")
            
            TextField("Número 2", text: $secondNumber)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .accessibilityLabel("Segundo número")
                .accessibilityHint("Insira o segundo valor a ser somado")

            Button("Somar") {
                calculateSum()
            }
            .font(.headline)
            .accessibilityLabel("Botão somar")
            .accessibilityHint("Realiza a soma dos dois números inseridos")

            Text(displayResult)
                .font(.title2)
                .accessibilityLabel("Resultado da soma")
                .accessibilityValue(resultAccessibilityValue)
        }
        .padding()
    }

    private func calculateSum() {
        let first = Double(firstNumber) ?? 0
        let second = Double(secondNumber) ?? 0
        result = first + second
    }

    private var displayResult: String {
        if let total = result {
            return String(format: "Resultado: %.2f", total)
        } else {
            return "Resultado: —"
        }
    }

    private var resultAccessibilityValue: String {
        if let total = result {
            return "\(total)"
        } else {
            return "Não calculado"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .large)
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}
