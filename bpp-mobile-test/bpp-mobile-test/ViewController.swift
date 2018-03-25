//
//  ViewController.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LoginService().login(email: "waldisney@brasilprepagos.com.br",
                             password: "Br@silPP123") { (result) in
                                switch result {
                                case .success:
                                    print("Sucesso")
                                case let .error(error):
                                    print(error)
                                }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

