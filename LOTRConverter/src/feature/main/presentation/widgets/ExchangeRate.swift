//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Александр on 14.10.2026.
//

import SwiftUI

struct ExchangeRateWidget: View {
    let firstCurrencyName: String
    let firstCurrencyImage: ImageResource
    let secondCurrencyName: String
    let secondCurrencyImage: ImageResource
    let bottomPadding: CGFloat
    
    init(
        firstCurrencyName: String,
        firstCurrencyImage: ImageResource,
        secondCurrencyName: String,
        secondCurrencyImage: ImageResource,
        bottomPadding: CGFloat = 16
    ) {
        self.firstCurrencyName = firstCurrencyName
        self.firstCurrencyImage = firstCurrencyImage
        self.secondCurrencyName = secondCurrencyName
        self.secondCurrencyImage = secondCurrencyImage
        self.bottomPadding = bottomPadding
    }
    
    var body: some View {
        HStack {
            CurrencyWidget(
                title: firstCurrencyName,
                image: firstCurrencyImage,
                textColor: .black
            )
            
            Text("=")
            
            CurrencyWidget(
                title: secondCurrencyName,
                image: secondCurrencyImage,
                textColor: .black
            )
        }.padding(.bottom, bottomPadding)
    }
}

#Preview {
    ExchangeRateWidget(
        firstCurrencyName: "1 Silver Penny",
        firstCurrencyImage: .silverpenny,
        secondCurrencyName: "100 Copper Pennies",
        secondCurrencyImage: .copperpenny,
    )
}
