//
//  AppTextField.swift
//  LOTRConverter
//
//  Created by Александр on 13.10.2026.
//


import SwiftUI

struct AppTextField: View {
    let text: Binding<String>
    let focus: FocusState<Bool>.Binding
    
    var body: some View {
        TextField("Amount", text: text)
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
            .focused(focus)
    }
}
