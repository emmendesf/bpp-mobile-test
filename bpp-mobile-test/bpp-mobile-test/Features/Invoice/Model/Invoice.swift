//
//  Invoice.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

struct Invoice: Codable {
    var transactionId: String
    var transactionDate: String
    var transactionFormattedDate: String
    var transactionCurrency: String
    var transactionAmount: Double
    var billingCurrency: String
    var billingAmount: Double
    var transactionStatus: String
    var transactionName: String
    var merchantName: String
    var mccCode: String
    var mccDescription: String
}
