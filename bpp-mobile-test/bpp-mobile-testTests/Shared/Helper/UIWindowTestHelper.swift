//
//  UIWindowTestHelper.swift
//  bpp-mobile-testTests
//
//  Created by Emerson Mendes Filho on 27/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import Foundation
import UIKit

class UIWindowTestHelper: NSObject {
    static let window: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
    
    static func showTestWindow(controller: UIViewController) {
        self.window.rootViewController = controller
        self.window.makeKeyAndVisible()
    }
    
    static func cleanTestWindow() {
        self.window.rootViewController = nil
        self.window.isHidden = true
    }
}

extension UIWindow {
    static var testWindow: UIWindow {
        return UIWindowTestHelper.window
    }
    
    static func showTestWindow(controller: UIViewController) {
        UIWindowTestHelper.showTestWindow(controller: controller)
    }
    
    static func cleanTestWindow() {
        UIWindowTestHelper.cleanTestWindow()
    }
}
