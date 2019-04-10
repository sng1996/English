//
//  StartViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var presenter: StartPresenterProtocol!
    var configurator: StartConfiguratorProtocol = StartConfigurator()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var data: [WordData] = [] {
        didSet {
            configurator.configure(with: self, data: data)
        }
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter.configureView()
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
