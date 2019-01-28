//
//  Constants.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

enum Language {
    static let en = "en"
    static let ru = "ru"
}

enum ScreenType {
    case iphone5, iphone8, iphonePlus, iphoneX, iphoneMax, ipad97, ipad105, ipad129
}

struct Screen {
    
    static var height: CGFloat = UIScreen.main.bounds.height
    static var width: CGFloat = UIScreen.main.bounds.width
    static var safeTop: CGFloat = -1.0
    static var safeBottom: CGFloat = -1.0
    static var heightCoef: CGFloat = Screen.height / 736
    static var widthCoef: CGFloat = Screen.width / 414
    
    static var type: ScreenType {
        switch height {
        case 568: return .iphone5
        case 667: return .iphone8
        case 736: return .iphonePlus
        case 812: return .iphoneX
        case 896: return .iphoneMax
        case 1024: return .ipad97
        case 1112: return .ipad105
        case 1366: return .ipad129
        default: return .iphone5
        }
    }
    
    static var sideInset: CGFloat {
        switch type {
        case .iphone5: return 20.0
        case .iphone8: return 25.0
        default: return 30
        }
    }
    
}
