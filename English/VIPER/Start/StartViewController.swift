//
//  StartViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartViewController: UIView {
    
    var presenter: StartPresenterProtocol!
    var configurator: StartConfiguratorProtocol = StartConfigurator()
    
    let headerContainer = UIView()
    
    let headerLabel = UILabel(
        text: "Закрепление",
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        text: "Пролистайте слова или нажмите «пропустить», чтобы начать обучение",
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20),
        alignment: .center
    )
    
    let returnButton = StartReturnButton()
    
    let cardsView = CardsView()
    
    let buttonsContainer = UIView()
    
    let backButton = BackButton()
    
    let passButton = StartPassButton()
    
    let startButton = StartButton()
    
    let cardsViewHeight = 414 * Screen.heightCoef + 40
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(with data: [WordData]) {
        super.init(frame: .zero)
        configurator.configure(with: self, data: data)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        cardsView.delegate = self
        returnButton.tapHandler = didTapReturnButton
        backButton.tapHandler = didTapBackButton
        passButton.tapHandler = didTapPassButton
        startButton.tapHandler = didTapStartButton
        
        addSubview(headerContainer)
        addSubview(cardsView)
        addSubview(buttonsContainer)
        headerContainer.addSubview(headerLabel)
        headerContainer.addSubview(footerLabel)
        headerContainer.addSubview(returnButton)
        buttonsContainer.addSubview(backButton)
        buttonsContainer.addSubview(passButton)
        buttonsContainer.addSubview(startButton)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cardsView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: returnButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: buttonsContainer)
        addConstraintsWithFormat(format: "H:|[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:[v0]|", views: passButton)
        addConstraintsWithFormat(format: "H:[v0]|", views: startButton)
        
        addConstraintsWithFormat(format: "V:|[v0][v1]|", views: headerLabel, footerLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: returnButton)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 30)-[v0]-(>=5)-[v1(\(cardsViewHeight))]-\(Screen.sideInset)-[v2(40)]-\(Screen.sideInset)-|", views: headerContainer, cardsView, buttonsContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: backButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: passButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: startButton)
    }
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func viewWillDisappear() {
        removeFromSuperview()
    }
    
    func didTapReturnButton() {
        cardsView.returnCard()
    }
    
    func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    func didTapPassButton() {
        presenter.didTapPassButton()
    }
    
    func didTapStartButton() {
        presenter.didTapStartButton()
    }
    
}

extension StartViewController: StartViewProtocol {
    
    func update() {
        cardsView.reloadData()
    }
    
}

extension StartViewController: CardsViewDelegate {
    
    func showReturnButton() {
        returnButton.isHidden = false
        headerLabel.isHidden = true
        footerLabel.isHidden = true
    }
    
    func hideReturnButton() {
        returnButton.isHidden = true
        headerLabel.isHidden = false
        footerLabel.isHidden = false
    }
    
    func showStartButton() {
        startButton.isHidden = false
        passButton.isHidden = true
    }
    
    func numberOfItems() -> Int {
        return presenter.numberOfItems()
    }
    
    func itemAt(_ index: Int) -> CardViewDataModel {
        return presenter.itemAt(index)
    }
    
}
