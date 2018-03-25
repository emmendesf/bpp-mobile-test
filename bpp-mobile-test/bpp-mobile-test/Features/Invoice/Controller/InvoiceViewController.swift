//
//  InvoiceViewController.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

class InvoiceViewController: UIViewController {
    let invoiceView = InvoiceView()
    let service: InvoiceServiceProtocol
    
    init(service: InvoiceServiceProtocol = InvoiceService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = invoiceView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInvoices()
    }
}

extension InvoiceViewController {
    fileprivate func fetchInvoices() {
        service.invoice { (result) in
            switch result {
            case .success:
                print("Sucesso")
            case let .error(error):
                print(error)
            }
        }
    }
}
