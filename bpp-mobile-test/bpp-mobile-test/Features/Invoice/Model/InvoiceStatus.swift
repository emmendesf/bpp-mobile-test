//
//  InvoiceStatus.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation
import UIKit

enum InvoiceStatus: String, Codable {
    case settled = "Settled"
    case pending = "Pending"
    case reversed = "Reversed"
    case declined = "Declined"
    
    var desc: String {
        switch self {
        case .settled:
            return "Aprovado"
        case .pending:
            return "Pendente"
        case .reversed:
            return "Cancelado"
        case .declined:
            return "Recusado"
        }
    }
    
    var color: UIColor {
        switch self {
        case .settled:
            return .CustomBlue
        case .pending:
            return .CustomYellow
        case .reversed:
            return .CustomOrange
        case .declined:
            return .CustomRed
        }
    }
}
