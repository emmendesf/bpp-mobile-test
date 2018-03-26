//
//  InvoiceDataSource.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

class InvoiceDataSource: NSObject {
    let invoiceList: [Invoice]
    let tableView: UITableView
    
    init(invoiceList: [Invoice], tableView: UITableView) {
        self.invoiceList = invoiceList
        self.tableView = tableView
        super.init()
        self.setupTableView()
    }
}

extension InvoiceDataSource {
    func setupTableView() {
        tableView.register(
            InvoiceTableViewCell.self,
            forCellReuseIdentifier: String(describing: InvoiceTableViewCell.self)
        )
    }
}

extension InvoiceDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return invoiceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: InvoiceTableViewCell.self)
            ) as? InvoiceTableViewCell else {
                let cell = InvoiceTableViewCell()
                return cell
        }
        
        let invoice = invoiceList[indexPath.row]
        cell.setup(invoice)
        
        //        guard let cell = tableView.dequeueReusableCell(
        //            withIdentifier: String(describing: InvoiceTableViewCell.self),
        //            for: indexPath
        //            ) as? InvoiceTableViewCell else {
        //                fatalError("Wrong cell type")
        //        }
        
        return cell
    }
    
}

