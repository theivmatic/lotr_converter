//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Александр on 13.10.2026.
//

import SwiftUI

struct MainView: View {
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
                            title: "Silver Piece", image: "silverpiece"
                        )
                        
                        
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        CurrencyWidget(
                            title: "Gold Piece", image: "goldpiece"
                        )
                        
                        
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding([.trailing], 32)
                }
                
            }
        }
    }
}

#Preview {
    MainView()
}
