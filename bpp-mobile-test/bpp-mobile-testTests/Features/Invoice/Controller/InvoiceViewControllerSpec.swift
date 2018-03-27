//
//  InvoiceViewControllerSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import bpp_mobile_test

final class InvoiceServiceMock: InvoiceServiceProtocol {
    fileprivate var invoiceResult: Result<[Invoice]>
    
    init(invoiceResult: Result<[Invoice]>) {
        self.invoiceResult = invoiceResult
    }
    
    func invoice(completion: @escaping (Result<[Invoice]>) -> Void) {
        completion(invoiceResult)
    }
}

final class InvoiceViewControlerSpec: QuickSpec {
    override func spec() {
        describe("given InvoiceViewControler") {
            context("when initializing") {
                var sut: InvoiceViewController!
                
                beforeEach {
                    let invoiceListMock = MockHelper<[Invoice], InvoiceViewControlerSpec>().mock(with: "invoice_list")
                    let serviceMock = InvoiceServiceMock(invoiceResult: Result.success(invoiceListMock))
                    sut = InvoiceViewController(service: serviceMock)
                    let nav = UINavigationController(rootViewController: sut)
                    UIWindow.showTestWindow(controller: nav)
                    _ = sut.view
                }
                
                afterEach {
                    sut = nil
                    UIWindow.cleanTestWindow()
                }
                
                it("should have the expected layout when screen loads") {
                    expect(UIWindow.testWindow) == snapshot()
                }
            }
        }
    }
}
