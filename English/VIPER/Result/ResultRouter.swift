//
//  ResultRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ResultRouter {
    
    weak var viewController: ResultViewController!
    
    init(viewController: ResultViewController) {
        self.viewController = viewController
    }
    
}

extension ResultRouter: ResultRouterProtocol {
    
}
