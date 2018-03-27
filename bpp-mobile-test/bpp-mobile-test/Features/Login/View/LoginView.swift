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
    
    fileprivate lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "fake_logo")
        imageView.contentMode = .center
        return imageView
    }()
    
    fileprivate lazy var emailTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "email"
        textField.borderStyle = .roundedRect
        textField.text = "waldisney@brasilprepagos.com.br"
        textField.keyboardType = .emailAddress
        textField.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return textField
    }()
    
    fileprivate lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = true
        textField.placeholder = "senha"
        textField.borderStyle = .roundedRect
        textField.text = "Br@silPP123"
        textField.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return textField
    }()
    
    fileprivate lazy var confirmButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("confirmar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .CustomBlue
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.addTarget(self, action:#selector(self.confirmTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy fileprivate(set) var activityIndicator = { () -> UIActivityIndicatorView in
        let aiv = UIActivityIndicatorView(frame: .zero)
        aiv.hidesWhenStopped = true
        aiv.activityIndicatorViewStyle = .gray
        return aiv
    }()
    
    fileprivate lazy var errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .CustomRed
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.isHidden = true
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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
    
    func updateViewState(_ state: ViewState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
            containerView.alpha = 0.5
            errorLabel.isHidden = true
            errorLabel.text = ""
        case .ready:
            activityIndicator.stopAnimating()
            containerView.alpha = 1
            errorLabel.isHidden = true
            errorLabel.text = ""
        case let .error(message):
            activityIndicator.stopAnimating()
            containerView.alpha = 1
            errorLabel.isHidden = false
            errorLabel.text = message
        }
    }
    
    @objc func confirmTapped() {
        confirmButtonCallback?()
    }
}

extension LoginView: ViewConfiguration {
    func setupConstraints() {
        logoImageView.snp.makeConstraints { (view) in
            view.centerX.equalToSuperview()
            view.height.equalTo(160)
            view.width.equalTo(171)
            view.top.equalToSuperview().offset(20)
        }
        
        errorLabel.snp.makeConstraints { (view) in
            view.centerX.equalToSuperview()
            view.left.equalToSuperview().offset(40)
            view.right.equalToSuperview().offset(-40)
            view.top.equalTo(logoImageView.snp.bottom).offset(20)
        }
        
        containerView.snp.makeConstraints { (view) in
            view.left.equalToSuperview().offset(20)
            view.right.equalToSuperview().offset(-20)
            view.centerX.equalToSuperview()
            view.top.equalTo(errorLabel.snp.bottom).offset(10)
        }
        
        emailTextField.snp.makeConstraints { (view) in
            view.height.equalTo(40)
            view.left.top.equalToSuperview()
            view.right.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { (view) in
            view.height.equalTo(40)
            view.left.right.equalToSuperview()
            view.top.equalTo(emailTextField.snp.bottom).offset(10)
            view.bottom.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints { (view) in
            view.left.equalToSuperview().offset(20)
            view.right.equalToSuperview().offset(-20)
            view.height.equalTo(40)
            view.top.equalTo(containerView.snp.bottom).offset(20)
        }
        
        activityIndicator.snp.makeConstraints { (view) in
            view.center.equalTo(containerView.snp.center)
        }
    }
    
    func buildViewHierarchy() {
        addSubview(logoImageView)
        addSubview(errorLabel)
        addSubview(containerView)
        containerView.addSubview(emailTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(activityIndicator)
        addSubview(confirmButton)
    }
}
