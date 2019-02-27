//
//  AddSetupExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension AddViewController {

    func setupViews() {
        backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        headerTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        buttonsView.delegate = self
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
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]-\(Screen.sideInset - 10)-|", views: headerTextField, loaderContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]", views: footerTextField, loaderContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: addTableView)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop / 2)-[v0]-3-[v1]-23-[v2][v3]|", views: headerTextField, footerTextField, addTableView, translatesView)
        
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
