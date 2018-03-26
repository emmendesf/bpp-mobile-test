//
//  InvoiceView.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

final class InvoiceView: UIView {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InvoiceView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (view) in
            view.edges.equalToSuperview()
        }
    }
    
    func configureViews() {
        
    }
}
