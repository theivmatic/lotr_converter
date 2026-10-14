//
//  Info.swift
//  LOTRConverter
//
//  Created by Александр on 14.10.2026.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.black)
            
            VStack {
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                    .padding(.bottom, 32)
                
                Text("Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                    .font(.title3)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                
                HStack {
                    CurrencyWidget(
                        title: "1 Gold Piece",
                        image: "goldpiece",
                        textColor: .black
                    )
                    
                    Text("=")
                    
                    CurrencyWidget(
                        title: "4 Gold Pennies",
                        image: "goldpenny",
                        textColor: .black
                    )
                }.padding(.bottom, 16)
                
                HStack {
                    CurrencyWidget(
                        title: "1 Gold Penny",
                        image: "goldpenny",
                        textColor: .black
                    )
                    
                    Text("=")
                    
                    CurrencyWidget(
                        title: "4 Silver Pieces",
                        image: "silverpiece",
                        textColor: .black
                    )
                }.padding(.bottom, 16)
                
                HStack {
                    CurrencyWidget(
                        title: "1 Silver Piece",
                        image: "silverpiece",
                        textColor: .black
                    )
                    
                    Text("=")
                    
                    CurrencyWidget(
                        title: "4 Silver Pennies",
                        image: "silverpenny",
                        textColor: .black
                    )
                }.padding(.bottom, 16)
                
                HStack {
                    CurrencyWidget(
                        title: "1 Silver Penny",
                        image: "silverpenny",
                        textColor: .black
                    )
                    
                    Text("=")
                    
                    CurrencyWidget(
                        title: "100 Copper Pennies",
                        image: "copperpenny",
                        textColor: .black
                    )
                }.padding(.bottom, 32)
                
                Button ("Done")  {
                    
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
