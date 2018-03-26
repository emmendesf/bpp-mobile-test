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
            return "Aprovada"
        case .pending:
            return "Pendente"
        case .reversed:
            return "Cancelada"
        case .declined:
            return "Recusada"
        }
    }
    
    var color: UIColor {
        switch self {
        case .settled:
            return .green
        case .pending:
            return .yellow
        case .reversed:
            return .gray
        case .declined:
            return .red
        }
    }
}
