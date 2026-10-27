//
//  currency.swift
//  LOTRConverter
//
//  Created by Александр on 13.10.2026.
//

import SwiftUI
import TipKit

struct CurrencyWidget: View {
    let title: String
    let image: ImageResource
    let textColor: Color
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text(title)
                .font(.headline)
                .foregroundStyle(textColor)
        }
    }
}
