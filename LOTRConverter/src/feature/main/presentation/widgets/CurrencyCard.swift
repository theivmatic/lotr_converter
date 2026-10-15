//
//  CurrencyCard.swift
//  LOTRConverter
//
//  Created by Александр on 14.10.2026.
//

import SwiftUI

struct CurrencyCard: View {
    let title: String
    let image: ImageResource
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            Text(title)
                .padding(3)
                .font(.caption)
                .frame(maxWidth: .infinity)
                .background(.brown)
            
        }
        .padding(5)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(.rect(cornerRadius: 25))
    }
}

#Preview {
    CurrencyCard(
        title: "Copper Penny",
        image: .copperpenny,
    )
}
