//
//  TranslateSetupExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension TranslateViewController {

    func setupViews() {
        isHidden = true
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        
        deleteButton.tapHandler = didTapDeleteButton
        optionsButton.tapHandler = didTapOptionsButton
        soundButton.tapHandler = didTapSoundButton
        
        addSubview(view)
        view.addSubview(panLine)
        view.addSubview(headerLabel)
        view.addSubview(footerLabel)
        view.addSubview(translatesView)
        view.addSubview(soundButton)
        view.addSubview(buttonsContainer)
        buttonsContainer.addSubview(deleteButton)
        buttonsContainer.addSubview(optionsButton)
        
        topConstraint = view.topAnchor.constraint(equalTo: bottomAnchor)
        
        panLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            panLine.widthAnchor.constraint(equalToConstant: 30),
            panLine.heightAnchor.constraint(equalToConstant: 4),
            panLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            soundButton.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -10),
            topConstraint
        ])
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: view)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: headerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: footerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: buttonsContainer)
        addConstraintsWithFormat(format: "V:|-[v0]-10-[v1]-3-[v2]-15-[v3][v4]-\(Screen.safeBottom / 2)-|", views: panLine, headerLabel, footerLabel, translatesView, buttonsContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: optionsButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: optionsButton)
    }
}
