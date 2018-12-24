//
//  CALayerExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension CALayer {
    
    func setShadow(
        color: UIColor = .black,
        offset: CGSize = CGSize(width: CGFloat(0.0), height: CGFloat(3.0)),
        opacity: CGFloat = 0.1,
        radius: CGFloat = 6.0
        ) {
        self.shadowColor = color.cgColor
        self.shadowOffset = offset
        self.shadowOpacity = Float(opacity)
        self.shadowRadius = radius
    }
    
}
