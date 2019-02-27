//
//  RepeatsRouter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsRouter {
    
    weak var viewController: RepeatsViewController!
    
    init(viewController: RepeatsViewController) {
        self.viewController = viewController
    }
    
}

extension RepeatsRouter: RepeatsRouterProtocol {
    
    func presentStartViewController(with data: [WordData]) {
        let startViewController = StartViewController(with: data)
        viewController.addSubview(startViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: startViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: startViewController)
        startViewController.viewDidAppear()
        ViewController.tabBarView.hide()
    }
    
    func presentTranslateViewController(with data: WordData) {
        let translateViewController = TranslateViewController(with: data)
        viewController.addSubview(translateViewController)
        viewController.addConstraintsWithFormat(format: "H:|[v0]|", views: translateViewController)
        viewController.addConstraintsWithFormat(format: "V:|[v0]|", views: translateViewController)
        translateViewController.viewDidAppear()
        ViewController.tabBarView.hide()
    }
    
    
    
}
