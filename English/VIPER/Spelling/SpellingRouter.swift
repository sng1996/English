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
    
    init(viewController: SpellingViewController) {
        self.viewController = viewController
    }
    
}

extension SpellingRouter: SpellingRouterProtocol {
    
    func back() {
        MainViewController.tabBarView.show()
        if let inboxViewController = viewController.superview as? InboxViewController {
            inboxViewController.viewDidAppear()
            inboxViewController.showOptimalCountHint()
        } else if let repeatsViewController = viewController.superview as? RepeatsViewController {
            UserDefaults.standard.set(true, forKey: UserDefaults.Keys.isRepeat)
            repeatsViewController.viewDidAppear()
        }
        viewController.viewWillDisappear()
    }
    
    func presentResultView(with mistakes: Int) {
        let resultView = ResultView()
        viewController.addSubview(resultView)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: resultView)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: resultView)
        resultView.viewDidAppear(with: mistakes)
    }
    
}
