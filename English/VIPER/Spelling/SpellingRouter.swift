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
    weak var navigationViewController: UINavigationController?
    
    init(viewController: SpellingViewController) {
        self.viewController = viewController
        navigationViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    }
    
}

extension SpellingRouter: SpellingRouterProtocol {
    
    func back() {
        navigationViewController?.popToRootViewController(animated: true)
    }
    
}
