//
//  ConnectionRouterSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Quick
import Nimble

@testable import bpp_mobile_test

final class ConnectionRouterSpec: QuickSpec {
    
    override func spec() {
        describe("given ConnectionRouter") {
            it("then it should load the correct paths") {
                expect(ConnectionRouter.login(email: "", password: "").path).to(equal("login"))
                expect(ConnectionRouter.invoice.path).to(equal("invoice"))
            }
            
            it("then it should load the correct methods") {
                expect(ConnectionRouter.login(email: "", password: "").method).to(equal(HTTPMethod.post))
                expect(ConnectionRouter.invoice.method).to(equal(HTTPMethod.get))
            }
            
            it("then it should load the correct parameters") {
                expect(ConnectionRouter.login(
                    email: "emerson",
                    password: "senha"
                    ).parameters).to(equal([
                        "email": "emerson",
                        "password": "senha"
                        ]))
                expect(ConnectionRouter.invoice.parameters).to(beNil())
            }
            
            it("then it should load the correct headers") {
                expect(ConnectionRouter.login(email: "", password: "").headers).to(beNil())
                expect(ConnectionRouter.invoice.headers).to(beNil())
            }
        }
    }
    
}
