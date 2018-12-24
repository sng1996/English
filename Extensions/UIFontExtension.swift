//
//  UIFontExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func book(_ size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Book", size: UIFont.size(size))!
    }
    
    static func medium(_ size: CGFloat) -> UIFont {
        return UIFont(name: "FuturaPT-Medium", size: UIFont.size(size))!
    }
    
    static func size(_ size: CGFloat) -> CGFloat {
        switch Screen.type {
        case .iphone5:
            if size < 30 {
                return size - 2
            } else if size < 36 {
                return size - 4
            } else {
                return size - 8
            }
        case .iphone8:
            if size < 30 {
                return size - 1
            } else if size < 36 {
                return size - 2
            } else {
                return size - 4
            }
        default:
            return size
        }
    }
    
}
