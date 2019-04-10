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
    weak var navigationViewController: UINavigationController?
    
    init(viewController: RepeatsViewController) {
        self.viewController = viewController
        navigationViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    }
    
}

extension RepeatsRouter: RepeatsRouterProtocol {
    
    func presentStartViewController(with data: [WordData]) {
        if let navVC = navigationViewController {
            let startViewController = StartViewController()
            startViewController.data = data
            navVC.pushViewController(startViewController, animated: true)
        }
    }
    
}
