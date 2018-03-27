//
//  ViewConfiguration.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 25/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation

protocol ViewConfiguration {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfiguration {
    func setupViews() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}

}
