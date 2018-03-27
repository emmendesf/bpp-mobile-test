//
//  ConnectionDispatcherMocl.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation
@testable import bpp_mobile_test

final class ConnectionDispatcherMock: Dispatcher {
    var shouldReturnSuccess = false
    var didCallSuccess = false
    
    required public init(environment: ConnectionEnvironment = EnvironmentType.default.environment) {
        
    }
    
    public func execute(request: Request, completion: @escaping DispatcherCompletion) throws {
        if shouldReturnSuccess {
            completion(Response.success(Data()))
            didCallSuccess = true
        } else {
            completion(Response.error(nil, nil))
            didCallSuccess = false
        }
    }
}
