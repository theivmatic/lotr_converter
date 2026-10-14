//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Александр on 13.10.2026.
//

import SwiftUI

struct MainView: View {
    @State var showExchangeInfo: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        CurrencyWidget(
                            title: "Silver Piece", image: "silverpiece", textColor: .white
                        )
                        
                        AppTextField(text: $leftAmount)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        CurrencyWidget(
                            title: "Gold Piece", image: "goldpiece", textColor: .white
                        )
                        
                        AppTextField(text: $rightAmount)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
                .background(.black.opacity(0.5))
                
                Spacer()
                HStack {
                    Spacer()

                    
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding([.trailing], 32)
                    }
                }
                
            }
        }
    }
}

#Preview {
    MainView()
}
