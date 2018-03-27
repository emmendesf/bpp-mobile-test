//
//  InvoiceServiceSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Quick
import Nimble

@testable import bpp_mobile_test

final class InvoiceServiceSpec: QuickSpec {
    override func spec() {
        var sut: InvoiceService!
        var connectionDispatcherMock: ConnectionDispatcherMock!
        
        describe("given InvoiceService") {
            
            beforeEach {
                connectionDispatcherMock = ConnectionDispatcherMock()
                connectionDispatcherMock.dataMock = MockHelper<[Invoice], InvoiceServiceSpec>().data(from: "invoice_list")
                let core = ConnectionCore(dispatcher: connectionDispatcherMock)
                sut = InvoiceService(core: core)
            }
            
            it("should be able to create a instance of Barcode Reader Service") {
                expect(sut).toNot(beNil())
            }
            
            context("when all requests succeed") {
                beforeEach {
                    connectionDispatcherMock.shouldReturnSuccess = true
                }
                
                it("then fetchPayments should succeed") {
                    sut.invoice(completion: ConnectionDispatcherMock.checkSuccessCallback)
                }
            }
            
            context("when all requests fail") {
                beforeEach {
                    connectionDispatcherMock.shouldReturnSuccess = false
                }
                
                it("then fetchPayments should fail") {
                    sut.invoice(completion: ConnectionDispatcherMock.checkErrorCallback)
                }
            }
        }
    }
}
