//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Александр on 13.10.2026.
//

import SwiftUI
import TipKit

struct MainView: View {
    @State var showExchangeInfo: Bool = false
    @State var showSelectCurrency: Bool = false
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    @FocusState var leftField
    @FocusState var rightField
    @FocusState private var leftFieldFocused: Bool
    @FocusState private var rightFieldFocused: Bool
    @State var firstSelectedCurrency: CurrencyEnum  = .copperPenny
    @State var secondSelectedCurrency: CurrencyEnum = .silverPiece
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            ImageBackground(image: .background)
            
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
                            textColor: .white,
                        )
                        .popoverTip(
                            currencyTip,
                            arrowEdge: .bottom
                        )
                        
                        
                        AppTextField(
                            text: $leftAmount,
                            focus: $leftField
                        )
                        .focused($leftFieldFocused)
                        .onChange(of: leftAmount) {
                            if leftField {
                                rightAmount = firstSelectedCurrency.convert(
                                    leftAmount,
                                    to: secondSelectedCurrency
                                )
                            }
                        }
                        .onChange(of: firstSelectedCurrency) {
                            UserDefaults.standard.set(
                                firstSelectedCurrency.name,
                                forKey: "defaultFirstCurrency"
                            )
                            rightAmount = secondSelectedCurrency.convert(
                                leftAmount,
                                to: firstSelectedCurrency
                            )
                        }
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        CurrencyWidget(
                            title: secondSelectedCurrency.name,
                            image: secondSelectedCurrency.image,
                            textColor: .white,
                        )
                        
                        AppTextField(
                            text: $rightAmount,
                            focus: $rightField
                        )
                        .focused($rightFieldFocused)
                        .onChange(of: rightAmount) {
                            if rightField {
                                leftAmount = secondSelectedCurrency.convert(
                                    rightAmount,
                                    to: firstSelectedCurrency
                                )
                            }
                        }
                        .onChange(of: secondSelectedCurrency) {
                            UserDefaults.standard.set(
                                secondSelectedCurrency.name,
                                forKey: "defaultSecondCurrency"
                            )
                            rightAmount = firstSelectedCurrency.convert(
                                leftAmount,
                                to: secondSelectedCurrency
                            )
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 32)
                .background(.black.opacity(0.5))
                .onTapGesture {
                    showSelectCurrency.toggle()
                    currencyTip.invalidate(reason: .actionPerformed)
                }
                .sheet(isPresented: $showSelectCurrency) {
                    SelectCurrencyView(
                        firstSelectedCurrency: $firstSelectedCurrency,
                        secondSelectedCurrency: $secondSelectedCurrency
                    )
                }
                
                Spacer()
                if !leftFieldFocused && !rightFieldFocused {
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
        .contentShape(Rectangle())
        .onTapGesture {
            if (leftFieldFocused) {
                leftFieldFocused = false
            }
            
            if (rightFieldFocused) {
                rightFieldFocused = false
            }
        }
        .task {
            try? Tips.configure()
            
            let defaultFirstCurrency = UserDefaults.standard.string(forKey: "defaultFirstCurrency")
            let defaultSecondCurrency = UserDefaults.standard.string(forKey: "defaultSecondCurrency")
            firstSelectedCurrency = CurrencyEnum.fromString(value: defaultFirstCurrency ??  "Copper Penny")
            secondSelectedCurrency = CurrencyEnum.fromString(value: defaultSecondCurrency ??  "Silver Penny")
        }
    }
}

#Preview {
    MainView()
}
