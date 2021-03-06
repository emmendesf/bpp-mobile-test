//
//  Response.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

public enum Response {
    case success(Data)
    case error(Int?, Error?)
    
    init(_ response: (r: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
        guard response.r?.statusCode == 200, response.error == nil else {
            self = .error(response.r?.statusCode, response.error)
            return
        }
        
        guard let data = response.data else {
            self = .error(response.r?.statusCode, ConnectionError.noData)
            return
        }
        
        let decoder = JSONDecoder()
        if let parsedResult = try? decoder.decode(ResponseModel.self, from: data) {
            if parsedResult.code != "200" {
                self = .error(Int(parsedResult.code), ConnectionError.custom(message: parsedResult.message ?? ""))
                return
            }
        }
        
        self = .success(data)
    }
}
