//
//  Dispatcher.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

public typealias DispatcherCompletion = (Response) -> Void
public protocol Dispatcher {
    init(environment: ConnectionEnvironment)
    func execute(request: Request, completion: @escaping DispatcherCompletion) throws
}
