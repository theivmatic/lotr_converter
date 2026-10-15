//
//  CurrenciesGrid.swift
//  LOTRConverter
//
//  Created by Александр on 15.10.2026.
//

import SwiftUI

struct CurrenciesGrid: View {
    @Binding var selectedCurrency: CurrencyEnum
    
    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(CurrencyEnum.allCases) { currency in
                CurrencyCard(
                    title: currency.name,
                    image: currency.image,
                    isSelected: selectedCurrency == currency,
                ) { selectedCurrency = currency }
                
            }
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    @Previewable @State var selectedCurrency: CurrencyEnum = .copperPenny
    
    CurrenciesGrid(selectedCurrency: $selectedCurrency)
}
