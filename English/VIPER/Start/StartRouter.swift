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
    weak var navigationViewController: UINavigationController?
    
    init(viewController: StartViewController) {
        self.viewController = viewController
        navigationViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    }
    
}

extension StartRouter: StartRouterProtocol {
    
    func back() {
        navigationViewController?.popViewController(animated: true)
    }
    
    func forward(with data: [WordData]) {
        if let navVC = navigationViewController {
            let choosingViewController = ChoosingViewController()
            choosingViewController.data = data
            navVC.pushViewController(choosingViewController, animated: true)
        }
    }
    
}

