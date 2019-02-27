////
////  SpellingSetup.swift
////  English
////
////  Created by Сергей Гаврилко on 27/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension SpellingView {
//
//    func setupViews() {
//        backButton.tapHandler = back
//        button.tapHandler = showAnswer
//        textField.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
//
//        addSubview(backButton)
//        addSubview(countLabel)
//        addSubview(headerLabel)
//        addSubview(button)
//        addSubview(footerLabel)
//        addSubview(textField)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: countLabel)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: button)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: textField)
//        
//        
//        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0]->=1-[v1]-20-[v2]-20-[v3(50)]->=20-[v4]-10-[v5]", views: backButton, countLabel, headerLabel, button, footerLabel, textField)
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        bottomConstraint = textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
//        bottomConstraint.isActive = true
//    }
//
//}
