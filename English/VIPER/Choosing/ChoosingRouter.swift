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
    
    init(viewController: ChoosingViewController) {
        self.viewController = viewController
    }
    
}

extension ChoosingRouter: ChoosingRouterProtocol {
    
    func back() {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.viewDidAppear()
        } else if let repeatsViewController = viewController.superview as? RepeatsViewController {
            repeatsViewController.viewDidAppear()
        }
        viewController.viewWillDisappear()
        ViewController.tabBarView.show()
    }
    
    func forward(with data: [WordData]) {
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.didSuccessfullyFinishChoosingView(with: data)
        } else if let repeatsViewController = viewController.superview as? RepeatsViewController {
            repeatsViewController.didSuccessfullyFinishChoosingView(with: data)
        }
        viewController.viewWillDisappear()
    }
    
    func presentResultView(with mistakes: Int) {
        let resultView = ResultView(with: mistakes)
        viewController.addSubview(resultView)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: resultView)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: resultView)
    }
    
}
