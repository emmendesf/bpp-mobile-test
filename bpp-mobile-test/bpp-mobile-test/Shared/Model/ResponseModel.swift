//
//  ResponseModel.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

struct ResponseModel: Codable {
    var code: String
    var message: String?
    var status: String
    
    enum ResponseModelKeys: String, CodingKey {
        case code
        case message
        case status
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseModelKeys.self)
        
        self.code = try container.decode(String.self, forKey: .code)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.status = try container.decode(String.self, forKey: .status)
    }
}
