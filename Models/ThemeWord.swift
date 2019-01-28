//
//  ThemeWord.swift
//  English
//
//  Created by Сергей Гаврилко on 28/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemeWord: NSObject {
    
    var isActive: Bool
    var data: ThemeWordData
    
    init(_ data: ThemeWordData) {
        self.isActive = false
        self.data = data
        super.init()
    }
    
}
