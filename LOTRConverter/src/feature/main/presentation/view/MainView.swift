//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Александр on 13.10.2026.
//

import SwiftUI

struct MainView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @State var firstSelectedCurrency: CurrencyEnum  = .copperPenny
    @State var secondSelectedCurrency: CurrencyEnum = .silverPiece
    
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
                            title: firstSelectedCurrency.name,
                            image: firstSelectedCurrency.image,
                            textColor: .white
                        )
                        
                        
                        AppTextField(text: $leftAmount)
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        CurrencyWidget(
                            title: secondSelectedCurrency.name,
                            image: secondSelectedCurrency.image,
                            textColor: .white
                        )
                        
                        AppTextField(text: $rightAmount)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
                .background(.black.opacity(0.5))
                .onTapGesture {
                    showSelectCurrency.toggle()
                }
                .sheet(isPresented: $showSelectCurrency) {
                    SelectCurrencyView(
                        firstSelectedCurrency: $firstSelectedCurrency,
                        secondSelectedCurrency: $secondSelectedCurrency
                    )
                }
                
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
                    .sheet(isPresented: $showExchangeInfo) {
                        InfoView()
                    }
                }
            }
           
        }
    }
}

#Preview {
    MainView()
}
