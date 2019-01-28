//
//  ViewControllerSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension ViewController {

    func setupViews() {
        ViewController.tabBarView.delegate = self
        
        view.addSubview(inboxView)
        view.addSubview(repeatsView)
        view.addSubview(settingsView)
        view.addSubview(thousandsView)
        view.addSubview(themesView)
        view.addSubview(prosesView)
        view.addSubview(ViewController.tabBarView)
        ViewController.tabBarView.setupModulesView()
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: inboxView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: repeatsView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: settingsView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: thousandsView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: themesView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: prosesView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: ViewController.tabBarView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: inboxView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: repeatsView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: settingsView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: thousandsView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: themesView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: prosesView)
        view.addConstraintsWithFormat(format: "V:[v0]|", views: ViewController.tabBarView)
    }

}
