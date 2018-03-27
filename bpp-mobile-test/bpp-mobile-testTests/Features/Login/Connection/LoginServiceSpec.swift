//
//  LoginServiceSpec.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Quick
import Nimble

@testable import bpp_mobile_test

final class LoginServiceSpec: QuickSpec {
    override func spec() {
        var sut: LoginService!
        var connectionDispatcherMock: ConnectionDispatcherMock!
        
        func checkSuccessCallback<T>(_ result: Result<T>) {
            expect(connectionDispatcherMock.didCallSuccess).to(beTruthy())
            expect({
                guard case .success = result else {
                    return .failed(reason: "wrong enum case")
                }
                return .succeeded
            }).to(succeed())
        }
        
        func checkErrorCallback<T>(_ result: Result<T>) {
            expect(connectionDispatcherMock.didCallSuccess).to(beFalsy())
            expect({
                guard case .error = result else {
                    return .failed(reason: "wrong enum case")
                }
                return .succeeded
            }).to(succeed())
        }
        
        describe("given LoginService") {
            
            beforeEach {
                connectionDispatcherMock = ConnectionDispatcherMock()
                let core = ConnectionCore(dispatcher: connectionDispatcherMock)
                sut = LoginService(core: core)
            }
            
            it("should be able to create a instance of Barcode Reader Service") {
                expect(sut).toNot(beNil())
            }
            
            context("when all requests succeed") {
                beforeEach {
                    connectionDispatcherMock.shouldReturnSuccess = true
                }
                
                it("then fetchPayments should succeed") {
                    sut.login(email: "", password: "", completion: checkSuccessCallback)
                }
            }
            
            context("when all requests fail") {
                beforeEach {
                    connectionDispatcherMock.shouldReturnSuccess = false
                }
                
                it("then fetchPayments should fail") {
                    sut.login(email: "", password: "", completion: checkErrorCallback)
                }
            }
        }
    }
}
