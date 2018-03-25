//
//  ConnectionCore.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

class ConnectionCore {
    private let dispatcher: Dispatcher
    
    init(dispatcher: Dispatcher = ConnectionDispatcher()) {
        self.dispatcher = dispatcher
    }
    
    func execute<C: Codable>(request: Request, completion: @escaping (Result<C>) -> ()) {
        do {
            try dispatcher.execute(request: request, completion: { (response) in
                switch response {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let parsedResult = try decoder.decode(C.self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(parsedResult))
                        }
                    } catch let error {
                        DispatchQueue.main.async {
                            print(error)
                            completion(Result.error(ConnectionError.parseFailed))
                        }
                    }
                case let .error(_, error):
                    DispatchQueue.main.async {
                        completion(.error(error ?? ConnectionError.requestFailed))
                    }
                }
            })
        } catch {
            DispatchQueue.main.async {
                completion(Result.error(ConnectionError.badInput))
            }
        }
    }
}
