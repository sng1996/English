//
//  SettingsRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SettingsRouter {
    
    weak var viewController: SettingsViewController!
    
    init(viewController: SettingsViewController) {
        self.viewController = viewController
    }
    
}

extension SettingsRouter: SettingsRouterProtocol {
    
}
