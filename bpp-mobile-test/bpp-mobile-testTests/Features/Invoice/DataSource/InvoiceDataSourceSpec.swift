//
//  InvoiceDataSourceSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import bpp_mobile_test

final class InvoiceDataSourceSpec: QuickSpec {
    
    override func spec() {
        describe("given InvoiceDataSource") {
            var sut: InvoiceDataSource!
            var tableView: UITableView!
            var invoiceListMock: [Invoice]!
            
            beforeEach {
                invoiceListMock = MockHelper<[Invoice], InvoiceViewControlerSpec>().mock(with: "invoice_list")
                let frame = CGRect(x: 0, y: 0, width: 320, height: 540)
                tableView = UITableView(frame: frame)
                sut = InvoiceDataSource(invoiceList: invoiceListMock, tableView: tableView)
                tableView.dataSource = sut
                tableView.reloadData()
            }
            
            it("then it should have the expected number of rows") {
                let rowsCount = sut.tableView(tableView, numberOfRowsInSection: 0)
                expect(rowsCount).to(equal(invoiceListMock.count))
            }
            
            it("then it should have the expected cell type for rows") {
                let rowsCount = sut.tableView(tableView, numberOfRowsInSection: 0)
                for row in 0..<rowsCount {
                    let indexPath = IndexPath(row: row, section: 0)
                    let cell = sut.tableView(tableView, cellForRowAt: indexPath)
                    expect(cell).to(beAKindOf(InvoiceTableViewCell.self),
                                    description: "row \(row)")
                }
            }
        }
    }
}
