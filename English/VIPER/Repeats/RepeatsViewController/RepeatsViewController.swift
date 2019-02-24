//
//  RepeatsViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsViewController: UIView {
    
    var presenter: RepeatsPresenterProtocol!
    var configurator: RepeatsConfiguratorProtocol = RepeatsConfigurator()
    
    let scrollView = RepeatsScrollView()
    
    let scrollContainer = UIView()
    
    let topContainer = UIView()
    
    let label = UILabel(
        text: "Повторение",
        font: UIFont.book(36)
    )
    
    let tv = RepeatsTableView()
    
    let translateView = TranslateView()
    
    let emptyView = RepeatsEmptyView()
    
    let badge = Badge()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        viewDidAppear()
    }
    
}

extension RepeatsViewController: RepeatsViewProtocol {
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func update() {
        tv.reloadData()
    }
    
    func showEmptyView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func showStartButton() {
        ViewController.tabBarView.showStartButton()
    }
    
    func hideStartButton() {
        ViewController.tabBarView.hideStartButton()
    }
    
    func openTranslateView(with model: TranslateViewDataModel) {
        translateView.open(with: model)
    }
    
}

extension RepeatsViewController: TranslateViewDelegate {
    
    func didCloseTranslateView() {
        scrollView.isActive = true
        presenter.configureView()
    }
    
}