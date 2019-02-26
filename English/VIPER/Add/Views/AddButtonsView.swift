//
//  AddButtonsView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol AddButtonsViewDelegate {
    func didTapSaveButton(with mode: SaveButtonMode)
    func didTapCancelButton()
}

class AddButtonsView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let saveButton = AddButtonSave()
    
    let cancelButton = AddButtonCancel()
    
    var delegate: AddButtonsViewDelegate!
    
    var currentMode: SaveButtonMode {
        get {
            return saveButton.currentMode
        }
        set {
            saveButton.currentMode = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.frame.size.height = 50.0
        backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        saveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(save)))
        cancelButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancel)))
        
        addSubview(stackView)
        stackView.addArrangedSubview(cancelButton)
        stackView.addArrangedSubview(saveButton)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: stackView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: stackView)
    }
    
    func currentModeToInit() {
        saveButton.currentMode = .arrow
    }
    
    @objc func save() {
        delegate.didTapSaveButton(with: currentMode)
    }
    
    @objc func cancel() {
        delegate.didTapCancelButton()
    }

}
