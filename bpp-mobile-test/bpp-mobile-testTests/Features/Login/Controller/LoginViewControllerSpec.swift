//
//  LoginViewControlerSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import bpp_mobile_test

final class LoginServiceMock: LoginServiceProtocol {
    fileprivate var loginResult: Result<ResponseModel>
    
    init(loginResult: Result<ResponseModel>) {
        self.loginResult = loginResult
    }
    
    func login(email: String, password: String, completion: @escaping (Result<ResponseModel>) -> Void) {
        completion(loginResult)
    }
}

final class LoginViewControllerSpec: QuickSpec {
    override func spec() {
        describe("given LoginViewControler") {
            context("when initializing") {
                var sut: LoginViewController!
                
                beforeEach {
                    let reponseModelMock = MockHelper<ResponseModel, LoginViewControllerSpec>().mock(with: "login_success")
                    let serviceMock = LoginServiceMock(loginResult: Result.success(reponseModelMock))
                    sut = LoginViewController(service: serviceMock)
                    let nav = UINavigationController(rootViewController: sut)
                    UIWindow.showTestWindow(controller: nav)
                    _ = sut.view
                }
                
                afterEach {
                    sut = nil
                    UIWindow.cleanTestWindow()
                }
                
                it("should have the expected layout when screen loads") {
                    expect(UIWindow.testWindow) == snapshot()
                }
            }
        }
    }
}
