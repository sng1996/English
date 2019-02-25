//
//  ChoosingRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingRouter {
    
    weak var viewController: ChoosingViewController!
    
    init(viewController: ChoosingViewController) {
        self.viewController = viewController
    }
    
}

extension ChoosingRouter: ChoosingRouterProtocol {
    
    func back() {
        
    }
    
    func presentResultView(with mistakes: Int) {
        
    }
    
}
