//
//  RepeatsRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsRouter {
    
    weak var viewController: RepeatsViewController!
    
    init(viewController: RepeatsViewController) {
        self.viewController = viewController
    }
    
}

extension RepeatsRouter: RepeatsRouterProtocol {
    
}
