//
//  MainViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ServiceProvider {

    var presenter: MainPresenterProtocol!
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    static let tabBarView = TabBarView()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Screen.safeTop >= 0 { return }
        
        if #available(iOS 11.0, *) {
            Screen.safeTop = view.safeAreaInsets.top
            Screen.safeBottom = view.safeAreaInsets.bottom
        } else {
            Screen.safeTop = topLayoutGuide.length
            Screen.safeBottom = bottomLayoutGuide.length
        }
        
        configurator.configure(with: self)
        setupViews()
        ViewController.tabBarView.buttons[0].didTap()
    }
    
    func setupViews() {
        ViewController.tabBarView.delegate = self
        
        view.addSubview(ViewController.tabBarView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: ViewController.tabBarView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: ViewController.tabBarView)
    }

}

extension MainViewController: MainViewProtocol {
    
}

extension MainViewController: TabBarViewDelegate {
    
    func didTapInboxButton() {
        presenter.didTapInboxButton()
    }
    
    func didTapRepeatsButton() {
        presenter.didTapRepeatsButton()
    }
    
    func didTapSettingsButton() {
        presenter.didTapSettingsButton()
    }
    
    func didTapStartButton() {
        presenter.didTapStartButton()
    }
    
}
