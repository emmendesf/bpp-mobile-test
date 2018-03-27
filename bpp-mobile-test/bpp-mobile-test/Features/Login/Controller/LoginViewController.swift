//
//  LoginViewController.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    fileprivate let loginView = LoginView()
    fileprivate let service: LoginServiceProtocol
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.title = "Login"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupGradient()
        self.edgesForExtendedLayout = []
    }
    
    init(service: LoginServiceProtocol = LoginService()) {
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension LoginViewController {
    func setupView() {
        loginView.setupConfirmButtonCallback { [unowned self] in
            self.login()
        }
    }
    
    func login() {
        service.login(email: loginView.email, password: loginView.password) { [unowned self] (result) in
            switch result {
            case .success:
                self.navigationController?.pushViewController(InvoiceViewController(), animated: true)
            case let .error(error):
                print(error)
            }
        }
    }
    
    func setupGradient() {
        self.view.addGradient(colors: [.CustomBlue, .white], direction: .top)
    }
}
