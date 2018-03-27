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
        tableView.allowsSelection = false
        return tableView
    }()
    
    lazy fileprivate(set) var activityIndicator = { () -> UIActivityIndicatorView in
        let aiv = UIActivityIndicatorView(frame: .zero)
        aiv.hidesWhenStopped = true
        aiv.activityIndicatorViewStyle = .gray
        return aiv
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InvoiceView {
    func updateViewState(_ state: ViewState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
            tableView.isHidden = true
        case .ready:
            activityIndicator.stopAnimating()
            tableView.isHidden = false
        case .error:
            activityIndicator.stopAnimating()
            tableView.isHidden = false
        }
    }
}

extension InvoiceView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(activityIndicator)
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (view) in
            view.edges.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { (view) in
            view.center.equalToSuperview()
        }
    }
}
