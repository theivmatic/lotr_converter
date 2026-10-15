//
//  Info.swift
//  LOTRConverter
//
//  Created by Александр on 14.10.2026.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ImageBackground(image: .parchment)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .padding(.bottom, 32)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                
                ExchangeRateWidget(
                    firstCurrencyName: "1 Gold Piece",
                    firstCurrencyImage: .goldpiece,
                    secondCurrencyName: "4 Gold Pennies",
                    secondCurrencyImage: .goldpenny
                )
                
                ExchangeRateWidget(
                    firstCurrencyName: "1 Gold Penny",
                    firstCurrencyImage: .goldpenny,
                    secondCurrencyName: "4 Silver Pieces",
                    secondCurrencyImage: .silverpiece
                )
                
                ExchangeRateWidget(
                    firstCurrencyName: "1 Silver Piece",
                    firstCurrencyImage: .silverpiece,
                    secondCurrencyName: "4 Silver Pennies",
                    secondCurrencyImage: .silverpenny
                )
                
                ExchangeRateWidget(
                    firstCurrencyName: "1 Silver Penny",
                    firstCurrencyImage: .silverpenny,
                    secondCurrencyName: "100 Copper Pennies",
                    secondCurrencyImage: .copperpenny,
                    bottomPadding: 32
                )
                
                Button("Done") {
                    dismiss()
                }
                    .buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    InfoView()
}
