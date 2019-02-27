//
//  TabBarSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension TabBarView {

    func setupViews() {
        backgroundColor = .white
        alpha = 0.0
        
        buttons[0].tapHandler = didTapInbox
        buttons[1].tapHandler = didTapRepeats
        buttons[2].tapHandler = didTapThemes
        buttons[3].tapHandler = didTapSettings
        startButton.tapHandler = didTapStart
        
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        
        addSubview(stackView)
        addSubview(startButton)
        addSubview(hintView)
        addSubview(startHintView)
        addSubview(line)
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: stackView)
        addConstraintsWithFormat(format: "V:|[v0(60)]", views: stackView)
        addConstraintsWithFormat(format: "V:[v0(\(height))]", views: self)
        addConstraintsWithFormat(format: "H:[v0]-10-|", views: startButton)
        addConstraintsWithFormat(format: "V:|[v0(60)]", views: startButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
        
        hintView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hintView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Screen.sideInset),
            hintView.bottomAnchor.constraint(equalTo: topAnchor, constant: -5),
            hintView.tailImageView.centerXAnchor.constraint(equalTo: buttons[2].centerXAnchor),
        ])
        
        startHintView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startHintView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Screen.sideInset),
            startHintView.bottomAnchor.constraint(equalTo: topAnchor, constant: -5),
            startHintView.tailImageView.centerXAnchor.constraint(equalTo: startButton.centerXAnchor),
        ])
    }

}
