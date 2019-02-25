//
//  SpellingRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingRouter {
    
    weak var viewController: SpellingViewController!
    
    init(viewController: SpellingViewController) {
        self.viewController = viewController
    }
    
}

extension SpellingRouter: SpellingRouterProtocol {
    
    func back() {
        
    }
    
    func finish() {
        
    }
    
}
