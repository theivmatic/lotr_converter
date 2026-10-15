//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Александр on 14.10.2026.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var firstSelectedCurrency: CurrencyEnum
    @Binding var secondSelectedCurrency: CurrencyEnum

    var body: some View {
        ZStack {
            ImageBackground(image: .parchment)

            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)

                CurrenciesGrid(
                    selectedCurrency: $firstSelectedCurrency
                )

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 16)
                
                CurrenciesGrid(
                    selectedCurrency: $secondSelectedCurrency
                )

                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundStyle(.white)
            }
            .padding()
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var firstSelectedCurrency: CurrencyEnum = .silverPenny
    @Previewable @State var secondSelectedCurrency: CurrencyEnum = .copperPenny
    
    SelectCurrencyView(
        firstSelectedCurrency: $firstSelectedCurrency,
        secondSelectedCurrency: $secondSelectedCurrency
    )
}
