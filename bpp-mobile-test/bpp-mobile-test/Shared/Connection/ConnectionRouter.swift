//
//  ConnectionRouter.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

enum ConnectionRouter: Request {
    case login(email: String, password: String)
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
        case .login:
            return .post
        case .invoice:
            return .get
        }
    }
    
    var parameters: [String : String]? {
        switch self {
        case let .login(email, password):
            return ["email": email, "password": password]
        default:
            return nil
        }
    }
    
    var headers: [String : Any]? {
        return nil
    }
}
