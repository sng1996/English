//
//  AddRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddRouter {

    weak var viewController: AddViewController!
    
    init(viewController: AddViewController) {
        self.viewController = viewController
    }

}

extension AddRouter: AddRouterProtocol {
    
    func changeScrollViewContentOffset(value: CGFloat) {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.changeScrollViewContentOffset(value: value)
        }
    }
    
    func fixScrollViewContentOffset(value: CGFloat) {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.fixScrollViewContentOffset(value: value)
        }
    }
    
    func close() {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.didCloseAddView()
        }
        viewController.viewWillDisappear()
        MainViewController.tabBarView.show()
    }
    
}
