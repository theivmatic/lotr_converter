//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Александр on 14.10.2026.
//

import SwiftUI

struct SelectCurrencyView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.black)

            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(CurrencyEnum.allCases) { currency in
                        CurrencyCard(
                            title: currency.name,
                            image: currency.image
                        )
                    }
                }

                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(CurrencyEnum.allCases) { currency in
                        CurrencyCard(
                            title: currency.name,
                            image: currency.image
                        )
                    }
                }

                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .foregroundStyle(.white)
            }
            .padding()
        }
    }
}

#Preview {
    SelectCurrencyView()
}
