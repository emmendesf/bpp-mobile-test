//
//  LoginService.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

protocol LoginServiceProtocol {
    func login(email: String,
               password: String,
               completion: @escaping (Result<ResponseModel>) -> Void)
}

class LoginService: LoginServiceProtocol {
    private let core: ConnectionCore
    
    init(core: ConnectionCore = ConnectionCore()) {
        self.core = core
    }
    
    func login(email: String,
               password: String,
               completion: @escaping (Result<ResponseModel>) -> Void) {
        
        guard let base64Password = password.base64Encoded() else {
            completion(Result.error(ConnectionError.parseFailed))
            return
        }
        
        core.execute(
            request: ConnectionRouter.login(email: email, password: base64Password),
            completion: completion
        )
    }
}

private extension String {
    func base64Encoded() -> String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
}

