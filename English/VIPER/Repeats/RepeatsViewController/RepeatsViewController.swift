//
//  RepeatsViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol RepeatsViewControllerDelegate {
    func showTabBar()
    func showStartButton()
    func hideStartButton()
    func repeatsVCOpenTranslateView(with data: WordData)
}

class RepeatsViewController: UIViewController {
    
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
    
    let emptyView = RepeatsEmptyView()
    
    let badge = Badge()
    
    var delegate: RepeatsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.configureView()
    }
    
    func didCloseTranslateView() {
        scrollView.isActive = true
        presenter.configureView()
    }
    
    func didTapStartButton() {
        presenter.didTapStartButton()
    }
    
}

extension RepeatsViewController: RepeatsViewProtocol {
    
    func update() {
        badge.sourceItem = presenter.getBadgeValue()
        tv.reloadData()
    }
    
    func showEmptyView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func showStartButton() {
        delegate?.showStartButton()
    }
    
    func hideStartButton() {
        delegate?.hideStartButton()
    }
    
    func openTranslateView(with data: WordData) {
        delegate?.repeatsVCOpenTranslateView(with: data)
    }
    
}

extension RepeatsViewController: TranslateViewDelegate {
    
    func translateViewDidClose() {
        delegate?.showTabBar()
        didCloseTranslateView()
    }
    
}


