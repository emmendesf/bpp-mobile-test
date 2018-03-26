//
//  TransactionCurrencyType.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

enum TransactionCurrencyType: String, Codable{
    case brl = "BRL"
    
    var locale: Locale {
        switch self {
        case .brl:
            return Locale(identifier: "pt_BR")
        }
    }
}
