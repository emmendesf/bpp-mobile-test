//
//  MockHelper.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation
@testable import bpp_mobile_test

final class MockHelper<T: Codable, B: AnyObject> {
    func mock(with fileName: String) -> T {
        let urlPath = Bundle(for: B.self).url(forResource: fileName, withExtension: "json")!
        let data = try! Data(contentsOf: urlPath, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.transactionFormattedDateFormatter)
        return try! decoder.decode(T.self, from: data)
    }
}
