//
//  ConnectionCore.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let transactionFormattedDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

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
                        decoder.dateDecodingStrategy = .formatted(DateFormatter.transactionFormattedDateFormatter)
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
