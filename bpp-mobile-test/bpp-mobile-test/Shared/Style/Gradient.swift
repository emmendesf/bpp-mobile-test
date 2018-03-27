//
//  Gradient.swift
//  bpp-mobile-test
//
//  Created by Emerson Mendes Filho on 26/03/2018.
//  Copyright © 2018 Emerson Mendes Filho. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    convenience init(frame: CGRect,
                     colors: [UIColor],
                     startPoint: CGPoint = CGPoint(x: 0, y: 0.2),
                     endPoint: CGPoint = CGPoint(x: 0, y: 1)) {
        self.init()
        self.frame = frame
        self.colors = colors.map { $0.cgColor }
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    func asUIImage() -> UIImage? {
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}
enum GradientDirection {
    case right
    case left
    case bottom
    case top
    case topLeftToBottomRight
    case topRightToBottomLeft
    case bottomLeftToTopRight
    case bottomRightToTopLeft
    
    fileprivate var startPoint: CGPoint {
        switch self {
        case .right: return CGPoint(x: 0, y: 0.5)
        case .left: return CGPoint(x: 1, y: 0.5)
        case .bottom: return CGPoint(x: 0.5, y: 0)
        case .top: return CGPoint(x: 0.5, y: 1)
        case .topLeftToBottomRight: return CGPoint(x: 0, y: 0)
        case .topRightToBottomLeft: return CGPoint(x: 1, y: 0)
        case .bottomLeftToTopRight: return CGPoint(x: 0, y: 1)
        case .bottomRightToTopLeft: return CGPoint(x: 1, y: 1)
        }
    }
    
    fileprivate var endPoint: CGPoint {
        switch self {
        case .right: return CGPoint(x: 1, y: 0.5)
        case .left: return CGPoint(x: 0, y: 0.5)
        case .bottom: return CGPoint(x: 0.5, y: 1)
        case .top: return CGPoint(x: 0.5, y: 0)
        case .topLeftToBottomRight: return CGPoint(x: 1, y: 1)
        case .topRightToBottomLeft: return CGPoint(x: 0, y: 1)
        case .bottomLeftToTopRight: return CGPoint(x: 1, y: 0)
        case .bottomRightToTopLeft: return CGPoint(x: 0, y: 0)
        }
    }
}

extension UIView {
    private var gradientName: String {
        return "gradientMask"
    }
    
    func addGradient(colors: [UIColor], direction: GradientDirection) {
        let gradientLayer = CAGradientLayer(
            frame: frame,
            colors: colors,
            startPoint: direction.startPoint,
            endPoint: direction.endPoint
        )
        gradientLayer.name = gradientName
        backgroundColor = colors.first ?? .clear
        layer.masksToBounds = true
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func removeGradients() {
        layer.sublayers?.forEach({if $0.name == gradientName { $0.removeFromSuperlayer()}})
    }
}

