//
//  AddRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddRouter {

    weak var view: AddView!
    
    init(view: AddView) {
        self.view = view
    }

}

extension AddRouter: AddRouterProtocol { }
