//
//  LoginView.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

typealias DefaultCallback = () -> Void

class LoginView: UIView {
    
    var confirmButtonCallback: DefaultCallback?
    
    var email: String {
        return emailTextField.text ?? ""
    }
    
    var password: String {
        return passwordTextField.text ?? ""
    }
    
    fileprivate lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "email"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    fileprivate lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = true
        textField.placeholder = "senha"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    fileprivate lazy var confirmButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("confirmar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action:#selector(self.confirmTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func setupConfirmButtonCallback(_ callback: @escaping DefaultCallback) {
        confirmButtonCallback = callback
    }
    
    @objc func confirmTapped() {
        confirmButtonCallback?()
    }
}

extension LoginView: ViewConfiguration {
    func setupConstraints() {
        containerView.snp.makeConstraints { (view) in
            view.left.equalToSuperview().offset(16)
            view.right.equalToSuperview().offset(-16)
            view.center.equalToSuperview()
        }
        
        emailTextField.snp.makeConstraints { (view) in
            view.height.equalTo(40)
            view.left.top.equalToSuperview()
            view.right.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { (view) in
            view.height.equalTo(40)
            view.left.equalToSuperview()
            view.right.equalToSuperview()
            view.top.equalTo(emailTextField.snp.bottom).offset(8)
            view.bottom.equalToSuperview().offset(-16)
        }
        
        confirmButton.snp.makeConstraints { (view) in
            view.left.equalToSuperview().offset(16)
            view.right.equalToSuperview().offset(-16)
            view.top.equalTo(passwordTextField.snp.bottom).offset(8)
        }
    }
    
    func buildViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        addSubview(confirmButton)
    }
    
    func configureViews() {
        
    }
}
