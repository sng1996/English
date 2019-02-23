//
//  NewThemeRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class NewThemeRouter {
    
    weak var viewController: NewThemeViewController!
    
    init(viewController: NewThemeViewController) {
        self.viewController = viewController
    }
    
}

extension NewThemeRouter: NewThemeRouterProtocol {
    
}

