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
    case platinumPiece = 0.25
    
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
        case .platinumPiece:
             .prancingpony
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
        case .platinumPiece:
             "Platinum Piece"
        }
    }
    
    static func fromString(value: String) -> CurrencyEnum {
        switch value {
        case "Copper Penny":
                .copperPenny
        case "Silver Penny":
                .silverPenny
        case "Silver Piece":
                .silverPiece
        case "Gold Penny":
                .goldPenny
        case "Gold Piece":
                .goldPiece
        case "Platinum Piece":
                .platinumPiece
        default:
                .copperPenny
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
