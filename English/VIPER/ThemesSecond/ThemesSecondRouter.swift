//
//  ThemesSecondRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesSecondRouter {
    
    weak var viewController: ThemesSecondViewController!
    
    init(viewController: ThemesSecondViewController) {
        self.viewController = viewController
    }
    
}

extension ThemesSecondRouter: ThemesSecondRouterProtocol {
    
}
