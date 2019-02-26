//
//  InboxRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxRouter {

    weak var viewController: InboxViewController!
    
    init(viewController: InboxViewController) {
        self.viewController = viewController
    }

}

extension InboxRouter: InboxRouterProtocol {
    
    func presentTranslateViewController(with data: WordData) {
        let translateViewController = TranslateViewController(with: data)
        viewController.addSubview(translateViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: translateViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: translateViewController)
        translateViewController.viewDidAppear()
        ViewController.tabBarView.hide()
    }
    
}
