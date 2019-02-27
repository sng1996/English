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
    
    var addViewController: AddViewController?
    
    init(viewController: InboxViewController) {
        self.viewController = viewController
    }
    
    func removeAddViewController() {
        if let viewController = addViewController {
            viewController.removeBlurView()
            viewController.removeFromSuperview()
        }
        addViewController = nil
    }

}

extension InboxRouter: InboxRouterProtocol {
    
    func presentStartViewController(with data: [WordData]) {
        let startViewController = StartViewController(with: data)
        viewController.addSubview(startViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: startViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: startViewController)
        startViewController.viewDidAppear()
        MainViewController.tabBarView.hide()
    }
    
    func presentChoosingViewController(with data: [WordData]) {
        let choosingViewController = ChoosingViewController(with: data)
        viewController.addSubview(choosingViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: choosingViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: choosingViewController)
        choosingViewController.viewDidAppear()
        MainViewController.tabBarView.hide()
    }
    
    func presentSpellingViewController(with data: [WordData]) {
        let spellingViewController = SpellingViewController(with: data)
        viewController.addSubview(spellingViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: spellingViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: spellingViewController)
        spellingViewController.viewDidAppear()
        MainViewController.tabBarView.hide()
    }
    
    func presentTranslateViewController(with data: WordData) {
        let translateViewController = TranslateViewController(with: data)
        viewController.addSubview(translateViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: translateViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: translateViewController)
        translateViewController.viewDidAppear()
        MainViewController.tabBarView.hide()
    }
    
    func presentAddViewController() {
        removeAddViewController()
        let blurView = viewController.createBlurView()
        let addViewController = AddViewController(with: blurView)
        viewController.addSubview(addViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: addViewController)
        addViewController.viewDidAppear()
        self.addViewController = addViewController
        MainViewController.tabBarView.hide()
    }
    
    func addViewDidDragging(_ contentOffset: CGFloat) {
        guard let addViewController = addViewController else { return }
        addViewController.viewDidDragging(contentOffset)
    }
    
    func addViewDidEndDragging(_ contentOffset: CGFloat) {
        guard let addViewController = addViewController else { return }
        addViewController.viewDidEndDragging(contentOffset)
    }
    
}
