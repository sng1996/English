//
//  CALayerExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

struct Shadow {
    var color: UIColor
    var offset: CGSize
    var opacity: Float
    var radius: CGFloat
}

extension CALayer {
    
    func setShadow(
        color: UIColor = .black,
        offset: CGSize = CGSize(width: CGFloat(0.0), height: CGFloat(3.0)),
        opacity: CGFloat = 0.1,
        radius: CGFloat = 6.0
        ) {
        shadowColor = color.cgColor
        shadowOffset = offset
        shadowOpacity = Float(opacity)
        shadowRadius = radius
    }
    
    func set(shadow: Shadow) {
        shadowColor = shadow.color.cgColor
        shadowOffset = shadow.offset
        shadowOpacity = shadow.opacity
        shadowRadius = shadow.radius
    }
    
}
