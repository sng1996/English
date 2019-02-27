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
    
    func close() {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.didCloseTranslateView()
        } else if let repeatsViewController = viewController.superview as? RepeatsViewController {
            repeatsViewController.didCloseTranslateView()
        }
        viewController.viewWillDisappear()
        MainViewController.tabBarView.show()
    }
    
}
