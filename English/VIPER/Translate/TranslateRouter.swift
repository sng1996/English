//
//  TranslateRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateRouter {

    weak var viewController: TranslateViewController!
    
    init(viewController: TranslateViewController) {
        self.viewController = viewController
    }

}

extension TranslateRouter: TranslateRouterProtocol {
    
}
