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
    var transactionFormattedDate: Date
    var transactionCurrency: TransactionCurrencyType
    var transactionAmount: Double
    var billingCurrency: String
    var billingAmount: Double
    var transactionStatus: InvoiceStatus
    var transactionName: String
    var merchantName: String
    var mccCode: String
    var mccDescription: String
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy 'às' HH:mm"
        return formatter.string(from: transactionFormattedDate)
    }
    
    var formattedTransactionAmount: String {
        let formatter = NumberFormatter()
        formatter.locale = transactionCurrency.locale
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: transactionAmount as NSNumber) {
            return formattedTipAmount
        }
        
        return ""
    }
}

extension DateFormatter {
    static let transactionFormattedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}
