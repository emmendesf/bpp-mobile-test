//
//  ConnectionEnvironment.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

public struct ConnectionEnvironment {
    public var name: String
    public var host: String
    public var headers: [String: Any] = [:]
    public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    
    public init(_ name: String, host: String, headers: [String: Any]) {
        self.name = name
        self.host = host
        self.headers = headers
    }
}

public enum EnvironmentType {
    case `default`
    
    public var environment: ConnectionEnvironment {
        switch self {
        case .default:
            let env = ConnectionEnvironment("default",
                                            host: "http://test-mobile.dev-bpp.com.br",
                                            headers: ["Content-Type": "application/json",
                                                      "Accept": "application/json"]
            )
            return env
        }
    }
}
