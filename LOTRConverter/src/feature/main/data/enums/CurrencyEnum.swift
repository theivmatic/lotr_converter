//
//  CurrencyEnum.swift
//  LOTRConverter
//
//  Created by Александр on 15.10.2026.
//

import SwiftUI

enum CurrencyEnum: Double, CaseIterable, Identifiable {
    case copperPenny = 64000
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var id: CurrencyEnum { self }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
             .copperpenny
        case .silverPenny:
             .silverpenny
        case .silverPiece:
             .silverpiece
        case .goldPenny:
             .goldpenny
        case .goldPiece:
             .goldpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
             "Copper Penny"
        case .silverPenny:
             "Silver Penny"
        case .silverPiece:
             "Silver Piece"
        case .goldPenny:
             "Gold Penny"
        case .goldPiece:
             "Gold Piece"
        }
    }
    
    func convert(_ amount: String, to currency: CurrencyEnum) -> String {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.numberStyle = .decimal
        
        guard let number = formatter.number(from: amount) else {
            return ""
        }
        
        let convertedAmount = (number.doubleValue / self.rawValue) * currency.rawValue
        
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        guard let result = formatter.string(from: NSNumber(value: convertedAmount)) else {
            return ""
        }
        
        return result
    }
}
