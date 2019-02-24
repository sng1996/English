//
//  StartRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartRouter {
    
    weak var viewController: StartViewController!
    
    init(viewController: StartViewController) {
        self.viewController = viewController
    }
    
}

extension StartRouter: StartRouterProtocol {
    
    func back() {
        
    }
    
    func presentChoosingView() {
        
    }
    
}

