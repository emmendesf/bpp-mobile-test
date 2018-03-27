//
//  ColorPallet.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 26/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

extension UIColor {
    static let CustomYellow = UIColor(netHex: 0xedc951)
    static let CustomOrange = UIColor(netHex: 0xeb6841)
    static let CustomRed = UIColor(netHex: 0xcc2a36)
    static let CustomBrown = UIColor(netHex: 0x4f372d)
    static let CustomBlue = UIColor(netHex: 0x00a0b0)
}
