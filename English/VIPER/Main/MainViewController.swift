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
        themesService.loadDataFromFiles()
        setupViews()
        MainViewController.tabBarView.buttons[0].didTap()
    }
    
    func setupViews() {
        MainViewController.tabBarView.delegate = self
        
        view.addSubview(MainViewController.tabBarView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: MainViewController.tabBarView)
        view.addConstraintsWithFormat(format: "V:[v0]|", views: MainViewController.tabBarView)
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
    
    func didTapThemesButton() {
        presenter.didTapThemesButton()
    }
    
    func didTapSettingsButton() {
        presenter.didTapSettingsButton()
    }
    
    func didTapStartButton() {
        presenter.didTapStartButton()
    }
    
}
