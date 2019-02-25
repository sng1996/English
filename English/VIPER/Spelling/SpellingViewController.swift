//
//  SpellingViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingViewControllerDataModel {
    
    var text: String
    
    init(_ spellingItem: SpellingItem) {
        text = spellingItem.wordData.translate
    }
    
}

class SpellingViewController: UIView {
    
    var presenter: SpellingPresenterProtocol!
    var configurator: SpellingConfiguratorProtocol = SpellingConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? SpellingViewControllerDataModel else { return }
            headerLabel.text = model.text
        }
    }
    
    let topContainer = UIView()
    
    let backButton = BackButton()
    
    let countLabel = UILabel(
        text: "0 из 10",
        color: UIColor(rgb: 0xE7E7E7),
        font: UIFont.book(18),
        alignment: .center
    )
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x1A1A1A),
        font: UIFont.book(36),
        alignment: .center,
        lines: 2,
        scale: 0.5
    )
    
    let button = SpellingButton()
    
    let footerLabel = UILabel(
        text: "введите перевод",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.book(18),
        alignment: .center
    )
    
    let customTextField = SpellingTextField()
    
    var bottomConstraint: NSLayoutConstraint!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        configurator.configure(with: self)
        setupViews()
        viewDidAppear()
    }
    
    func setupViews() {
        backButton.tapHandler = didTapBackButton
        button.tapHandler = didTapShowAnswer
        customTextField.delegate = self
        
        addSubview(backButton)
        addSubview(countLabel)
        addSubview(headerLabel)
        addSubview(button)
        addSubview(footerLabel)
        addSubview(customTextField)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: countLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: button)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: customTextField)
        
        
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0]->=1-[v1]-20-[v2]-20-[v3(50)]->=20-[v4]-10-[v5]", views: backButton, countLabel, headerLabel, button, footerLabel, customTextField)
        
        translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        bottomConstraint = customTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        bottomConstraint.isActive = true
    }
    
    func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    func didTapShowAnswer() {
        presenter.didTapShowAnswer()
    }
    
}

extension SpellingViewController: SpellingViewProtocol {
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func update() {
        speechManager.play(vm.getOriginal())
        textField.textField.textColor = UIColor(rgb: 0x53D397)
        var delay = 0.5
        if self.vm.getOriginal().count > 10 {
            delay = Double(self.vm.getOriginal().count) / 20.0
        }
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(finishStep), userInfo: nil, repeats: false)
    }
    
}

extension SpellingViewController: SpellingTextFieldDelegate {
    
    func textFieldDidChange(with text: String) {
        presenter.textFieldDidChange(with: text)
    }
    
}
