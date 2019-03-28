//
//  MainRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MainRouter {

    weak var viewController: MainViewController!
    
    var currentViewController: UIView?
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func removeCurrentViewController() {
        if let current = currentViewController {
            current.removeFromSuperview()
            self.currentViewController = nil
        }
    }

}

extension MainRouter: MainRouterProtocol {
    
    func presentInboxViewController() {
        removeCurrentViewController()
        let inboxViewController = InboxViewController()
        self.currentViewController = inboxViewController
        viewController.view.insertSubview(inboxViewController, belowSubview: MainViewController.tabBarView)
        viewController.view.addConstraintsWithFormat(format: "H:|[v0]|", views: inboxViewController)
        viewController.view.addConstraintsWithFormat(format: "V:|[v0]|", views: inboxViewController)
        inboxViewController.viewDidAppear()
    }
    
    func presentRepeatsViewController() {
        removeCurrentViewController()
        let repeatsViewController = RepeatsViewController()
        self.currentViewController = repeatsViewController
        viewController.view.insertSubview(repeatsViewController, belowSubview: MainViewController.tabBarView)
        viewController.view.addConstraintsWithFormat(format: "H:|[v0]|", views: repeatsViewController)
        viewController.view.addConstraintsWithFormat(format: "V:|[v0]|", views: repeatsViewController)
        repeatsViewController.viewDidAppear()
    }
    
    func presentThemesViewController() {
        removeCurrentViewController()
        let themesViewController = MusicViewController()
        self.currentViewController = themesViewController
        viewController.view.insertSubview(themesViewController, belowSubview: MainViewController.tabBarView)
        viewController.view.addConstraintsWithFormat(format: "H:|[v0]|", views: themesViewController)
        viewController.view.addConstraintsWithFormat(format: "V:|[v0]|", views: themesViewController)
        MainViewController.tabBarView.hideStartButton()
        //themesViewController.viewDidAppear()
    }
    
    func presentSettingsViewController() {
        removeCurrentViewController()
        let settingsViewController = SettingsViewController()
        self.currentViewController = settingsViewController
        viewController.view.insertSubview(settingsViewController, belowSubview: MainViewController.tabBarView)
        viewController.view.addConstraintsWithFormat(format: "H:|[v0]|", views: settingsViewController)
        viewController.view.addConstraintsWithFormat(format: "V:|[v0]|", views: settingsViewController)
        MainViewController.tabBarView.hideStartButton()
        settingsViewController.viewDidAppear()
    }
    
    func didTapStartButton() {
        if let inboxViewController = currentViewController as? InboxViewController {
            inboxViewController.didTapStartButton()
            return
        }
        if let repeatsViewController = currentViewController as? RepeatsViewController {
            repeatsViewController.didTapStartButton()
            return
        }
    }
    
}
