//
//  TranslateRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateRouter {

    weak var view: TranslateView!
    
    init(view: TranslateView) {
        self.view = view
    }

}

extension TranslateRouter: TranslateRouterProtocol { }
