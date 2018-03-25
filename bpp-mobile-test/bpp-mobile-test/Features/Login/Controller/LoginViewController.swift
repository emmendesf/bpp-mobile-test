//
//  LoginViewController.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
}
