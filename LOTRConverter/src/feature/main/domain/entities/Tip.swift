//
//  Tip.swift
//  LOTRConverter
//
//  Created by Александр on 16.10.2026.
//

import TipKit

struct CurrencyTip: Tip {
    var title =  Text("Change currency")
    
    var message: Text?  = Text("You can tap the left or right currency to bring up the currency picker.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
