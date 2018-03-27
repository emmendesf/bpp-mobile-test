//
//  ConnectionDispatcherMocl.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation
import Nimble
@testable import bpp_mobile_test

final class ConnectionDispatcherMock: Dispatcher {
    var shouldReturnSuccess = false
    var dataMock = Data()
    
    required public init(environment: ConnectionEnvironment = EnvironmentType.default.environment) {
        
    }
    
    public func execute(request: Request, completion: @escaping DispatcherCompletion) throws {
        if shouldReturnSuccess {
            completion(Response.success(dataMock))
        } else {
            completion(Response.error(nil, nil))
        }
    }
    
    class func checkSuccessCallback<T>(_ result: Result<T>) {
        expect({
            guard case .success = result else {
                return .failed(reason: "wrong enum case")
            }
            return .succeeded
        }).to(succeed())
    }
    
    class func checkErrorCallback<T>(_ result: Result<T>) {
        expect({
            guard case .error = result else {
                return .failed(reason: "wrong enum case")
            }
            return .succeeded
        }).to(succeed())
    }
}
