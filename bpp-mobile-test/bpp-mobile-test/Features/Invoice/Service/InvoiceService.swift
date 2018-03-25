//
//  InvoiceService.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

protocol InvoiceServiceProtocol {
    func invoice(completion: @escaping (Result<[Invoice]>) -> Void)
}

class InvoiceService: InvoiceServiceProtocol {
    private let core: ConnectionCore
    
    init(core: ConnectionCore = ConnectionCore()) {
        self.core = core
    }
    
    func invoice(completion: @escaping (Result<[Invoice]>) -> Void) {
        core.execute(
            request: ConnectionRouter.invoice,
            completion: completion
        )
    }
}
