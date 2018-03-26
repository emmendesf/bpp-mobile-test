//
//  InvoiceTableViewCell.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

final class InvoiceTableViewCell: UITableViewCell {
    
    fileprivate lazy var leftContainerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    fileprivate lazy var verticalLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return view
    }()
    
    fileprivate lazy var circleStatusView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.backgroundColor = .green
        return view
    }()
    
    fileprivate lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.gray.withAlphaComponent(0.7)
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    fileprivate lazy var merchantLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    fileprivate lazy var statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    fileprivate lazy var amountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    fileprivate lazy var separatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InvoiceTableViewCell {
    func setup(_ invoice: Invoice) {
        dateLabel.text = invoice.formattedDate
        merchantLabel.text = invoice.merchantName
        amountLabel.text = invoice.formattedTransactionAmount
        statusLabel.text = invoice.transactionStatus.desc
        statusLabel.textColor = invoice.transactionStatus.color
        circleStatusView.backgroundColor = invoice.transactionStatus.color
    }
}

extension InvoiceTableViewCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(merchantLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(separatorView)
        contentView.addSubview(leftContainerView)
        leftContainerView.addSubview(verticalLineView)
        leftContainerView.addSubview(circleStatusView)
    }
    
    func setupConstraints() {
        leftContainerView.snp.makeConstraints { (view) in
            view.left.top.bottom.equalToSuperview()
            view.width.equalTo(45)
        }
        
        verticalLineView.snp.makeConstraints { (view) in
            view.right.top.bottom.equalToSuperview()
            view.width.equalTo(1)
        }
        
        circleStatusView.snp.makeConstraints { (view) in
            view.width.height.equalTo(16)
            view.centerX.equalTo(verticalLineView.snp.centerX)
            view.centerY.equalTo(leftContainerView.snp.centerY)
        }
        
        dateLabel.snp.makeConstraints { (view) in
            view.left.equalTo(leftContainerView.snp.right).offset(16)
            view.top.equalToSuperview().offset(16)
            view.right.equalToSuperview().inset(16)
        }
        
        merchantLabel.snp.makeConstraints { (view) in
            view.left.equalTo(leftContainerView.snp.right).offset(16)
            view.right.equalTo(amountLabel.snp.left).offset(-8)
            view.top.equalTo(dateLabel.snp.bottom).offset(16)
        }
        
        amountLabel.snp.makeConstraints { (view) in
            view.right.equalToSuperview().inset(16)
            view.left.equalTo(merchantLabel.snp.right).offset(8)
            view.top.equalTo(dateLabel.snp.bottom).offset(16)
        }
        
        statusLabel.snp.makeConstraints { (view) in
            view.left.equalTo(leftContainerView.snp.right).offset(16)
            view.right.equalToSuperview().inset(16)
            view.top.equalTo(merchantLabel.snp.bottom).offset(16)
        }
        
        separatorView.snp.makeConstraints { (view) in
            view.left.equalTo(leftContainerView.snp.right).offset(16)
            view.right.equalToSuperview().inset(16)
            view.top.equalTo(statusLabel.snp.bottom).offset(16)
            view.bottom.equalToSuperview()
            view.height.equalTo(1)
        }
    }
    
    func configureViews() {
        
    }
}
