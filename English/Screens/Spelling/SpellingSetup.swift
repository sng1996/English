//
//  SpellingSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension SpellingView {

    func setupViews() {
        backButton.tapHandler = back
        button.tapHandler = showAnswer
        textView.inputAccessoryView = button
        textView.delegate = self
        
        addSubview(topContainer)
        addSubview(headerLabel)
        addSubview(textView)
        topContainer.addSubview(backButton)
        topContainer.addSubview(countLabel)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: topContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: textView)
        
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset)-[v0]->=\(Screen.sideInset)-[v1]-20-[v2]", views: topContainer, headerLabel, textView)
        
        addConstraintsWithFormat(format: "H:|[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:[v0]|", views: countLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: backButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: countLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        bottomConstraint = textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        bottomConstraint.isActive = true
    }

}
