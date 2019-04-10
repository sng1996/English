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
    weak var navigationViewController: UINavigationController?
    
    init(viewController: ChoosingViewController) {
        self.viewController = viewController
        navigationViewController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController
    }
    
}

extension ChoosingRouter: ChoosingRouterProtocol {
    
    func back() {
        navigationViewController?.popToRootViewController(animated: true)
    }
    
    func forward(with data: [WordData]) {
        if let navVC = navigationViewController {
            let spellingViewController = SpellingViewController()
            spellingViewController.data = data
            navVC.pushViewController(spellingViewController, animated: true)
        }
    }
    
}
