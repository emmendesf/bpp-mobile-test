//
//  ConnectionRouter.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

enum ConnectionRouter: Request {
    case login
    case invoice
    
    var path: String {
        switch self {
        case .login:
            return "login"
        case .invoice:
            return "invoice"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login,
             .invoice:
            return .get
        }
    }
    
    var headers: [String : Any]? {
        return nil
    }
}
