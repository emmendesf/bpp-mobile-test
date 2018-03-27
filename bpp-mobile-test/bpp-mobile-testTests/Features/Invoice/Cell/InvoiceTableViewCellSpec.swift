//
//  InvoiceTableViewCellSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 26/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import bpp_mobile_test

class InvoiceTableViewCellSpec: QuickSpec {
    override func spec() {
        var sut: InvoiceTableViewCell!
        var invoiceMock: Invoice!
        
        describe("given InvoiceTableViewCell") {
            beforeEach {
                invoiceMock = MockHelper<Invoice, InvoiceTableViewCellSpec>().mock(with: "invoice_object")
                sut = InvoiceTableViewCell()
                sut.frame = CGRect(x: 0, y: 0, width: 320, height: 162)
                sut.backgroundColor = .white
            }
            context("when creating a new cell with settled transaction status") {
                beforeEach {
                    invoiceMock.transactionStatus = .settled
                    sut.setup(invoiceMock)
                }
                
                it ("then it should show the correct layout") {
                    expect(sut) == snapshot()
                }
            }
            
            context("when creating a new cell with pending transaction status") {
                beforeEach {
                    invoiceMock.transactionStatus = .pending
                    sut.setup(invoiceMock)
                }
                
                it ("then it should show the correct layout") {
                    expect(sut) == snapshot()
                }
            }
            
            context("when creating a new cell with reversed transaction status") {
                beforeEach {
                    invoiceMock.transactionStatus = .reversed
                    sut.setup(invoiceMock)
                }
                
                it ("then it should show the correct layout") {
                    expect(sut) == snapshot()
                }
            }
            
            context("when creating a new cell with declined transaction status") {
                beforeEach {
                    invoiceMock.transactionStatus = .declined
                    sut.setup(invoiceMock)
                }
                
                it ("then it should show the correct layout") {
                    expect(sut) == snapshot()
                }
            }
        }
    }
}
