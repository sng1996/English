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
    
    init(viewController: StartViewController) {
        self.viewController = viewController
    }
    
}

extension StartRouter: StartRouterProtocol {
    
    func back() {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.viewDidAppear()
        } else if let repeatsViewController = viewController.superview as? RepeatsViewController {
            repeatsViewController.viewDidAppear()
        }
        viewController.viewWillDisappear()
        MainViewController.tabBarView.show()
    }
    
    func forward(with data: [WordData]) {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.didSuccessfullyFinishStartView(with: data)
        } else if let repeatsViewController = viewController.superview as? RepeatsViewController {
            repeatsViewController.didSuccessfullyFinishStartView(with: data)
        }
        viewController.viewWillDisappear()
    }
    
}

