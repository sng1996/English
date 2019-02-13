//
//  AddView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UITextView_Placeholder
import UIKit

protocol AddViewDelegate {
    func hideAddView()
}

class AddView: UIView {
    
    let headerTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Введите слово или фразу"
        textField.font = UIFont.book(22)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    let footerTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "Введите перевод"
        textField.font = UIFont.book(18)
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.borderStyle = .none
        textField.returnKeyType = .done
        textField.keyboardLanguage = "ru"
        return textField
    }()
    
    let loaderContainer = UIView()
    
    let addTableView = AddTableView()
    
    let translatesView = TranslatesView()
    
    let buttonsView = AddButtonsView()

    var blurView: BlurView? {
        didSet {
            guard let view = blurView else { return }
            view.container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCancelButton)))
            view.isUserInteractionEnabled = true
        }
    }
    
    let vm = AddViewModel()
    
    var loaderWidthConstraint: NSLayoutConstraint!
    var footerHeightConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    var delegate: AddViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        headerTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        footerTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        buttonsView.delegate = self
        vm.delegate = self
        headerTextField.delegate = self
        footerTextField.delegate = self
        addTableView.delegate = self
        translatesView.delegate = self
        
        headerTextField.inputAccessoryView = buttonsView
        footerTextField.inputAccessoryView = buttonsView
        
        addSubview(headerTextField)
        addSubview(footerTextField)
        addSubview(loaderContainer)
        addSubview(addTableView)
        addSubview(translatesView)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]-\(Screen.sideInset - 10)-|", views: headerTextField, loaderContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]", views: footerTextField, loaderContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: addTableView)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop / 2)-[v0]-3-[v1]-10-[v2][v3]|", views: headerTextField, footerTextField, addTableView, translatesView)
        
        NSLayoutConstraint.activate([
            loaderContainer.heightAnchor.constraint(equalToConstant: 48),
            loaderContainer.centerYAnchor.constraint(equalTo: headerTextField.centerYAnchor)
        ])
        
        loaderWidthConstraint = loaderContainer.widthAnchor.constraint(equalToConstant: 0)
        loaderWidthConstraint.isActive = true
        footerHeightConstraint = footerTextField.heightAnchor.constraint(equalToConstant: 0)
        footerHeightConstraint.isActive = true
    }
    
}
