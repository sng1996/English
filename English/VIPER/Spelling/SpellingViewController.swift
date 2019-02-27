//
//  SpellingViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingViewDataModel {
    
    var header: String
    var count: String
    
    init(header: String, count: String) {
        self.header = header
        self.count = count
    }
    
}

class SpellingViewController: UIView {
    
    var presenter: SpellingPresenterProtocol!
    var configurator: SpellingConfiguratorProtocol = SpellingConfigurator()
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? SpellingViewDataModel else { return }
            headerLabel.text = model.header
            customTextField.textField.text = ""
            customTextField.textField.textColor = .black
            customTextField.textField.becomeFirstResponder()
            countLabel.text = model.count
            bottomConstraint.constant = -Keyboard.height
            layoutIfNeeded()
            showViews()
            
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
    
    init(with data: [WordData]) {
        super.init(frame: .zero)
        configurator.configure(with: self, data: data)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
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
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
    func viewWillDisappear() {
        removeFromSuperview()
    }
    
    func didTapBackButton() {
        presenter.didTapBackButton()
    }
    
    func didTapShowAnswer() {
        headerLabel.text = presenter.getAnswer()
    }
    
    func resultViewDidTapNext() {
        presenter.resultViewDidTapNext()
    }
    
    func resultViewDidTapRepeat() {
        presenter.resultViewDidTapRepeat()
    }
    
    func showViews() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 1.0
            self.customTextField.alpha = 1.0
        }, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            Keyboard.height = keyboardFrame.height
        }
    }
    
}

extension SpellingViewController: SpellingViewProtocol {
    
    func hideViews() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.headerLabel.alpha = 1.0
            self.customTextField.alpha = 1.0
        }, completion: { complete in
            self.presenter.didFinishHideViews()
        })
    }
    
    func updateWithRightAnswer() {
        customTextField.textField.textColor = UIColor(rgb: 0x53D397)
    }
    
    func hideKeyboard() {
        customTextField.textField.resignFirstResponder()
    }
    
}

extension SpellingViewController: SpellingTextFieldDelegate {
    
    func textFieldDidChange(with text: String) {
        headerLabel.text = presenter.getHeader()
        presenter.textFieldDidChange(with: text)
    }
    
}
