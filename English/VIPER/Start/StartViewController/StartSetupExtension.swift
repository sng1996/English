//
//  StartSetupExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 08/04/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension StartViewController {

    func setupViews() {
        view.backgroundColor = .white
        
        cardsView.delegate = self
        returnButton.tapHandler = didTapReturnButton
        backButton.tapHandler = didTapBackButton
        passButton.tapHandler = didTapPassButton
        startButton.tapHandler = didTapStartButton
        
        view.addSubview(headerContainer)
        view.addSubview(cardsView)
        view.addSubview(buttonsContainer)
        headerContainer.addSubview(headerLabel)
        headerContainer.addSubview(footerLabel)
        headerContainer.addSubview(returnButton)
        buttonsContainer.addSubview(backButton)
        buttonsContainer.addSubview(passButton)
        buttonsContainer.addSubview(startButton)
        
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerContainer)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: cardsView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: returnButton)
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: buttonsContainer)
        view.addConstraintsWithFormat(format: "H:|[v0]", views: backButton)
        view.addConstraintsWithFormat(format: "H:[v0]|", views: passButton)
        view.addConstraintsWithFormat(format: "H:[v0]|", views: startButton)
        
        view.addConstraintsWithFormat(format: "V:|[v0][v1]|", views: headerLabel, footerLabel)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: returnButton)
        view.addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 30)-[v0]-(>=5)-[v1(\(cardsViewHeight))]-\(Screen.sideInset)-[v2(40)]-\(Screen.sideInset)-|", views: headerContainer, cardsView, buttonsContainer)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: backButton)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: passButton)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: startButton)
    }

}
