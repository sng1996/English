////
////  StartSetup.swift
////  English
////
////  Created by Сергей Гаврилко on 27/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension StartView {
//    
//    func setupViews() {
//        cardsView.delegate = self
//        returnButton.tapHandler = cardsView.returnCard
//        backButton.tapHandler = back
//        passButton.tapHandler = openChoosingView
//        startButton.tapHandler = openChoosingView
//        returnButton.isHidden = true
//        startButton.isHidden = true
//        
//        addSubview(headerContainer)
//        addSubview(cardsView)
//        addSubview(buttonsContainer)
//        headerContainer.addSubview(headerLabel)
//        headerContainer.addSubview(footerLabel)
//        headerContainer.addSubview(returnButton)
//        buttonsContainer.addSubview(backButton)
//        buttonsContainer.addSubview(passButton)
//        buttonsContainer.addSubview(startButton)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerContainer)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: cardsView)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: returnButton)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: buttonsContainer)
//        addConstraintsWithFormat(format: "H:|[v0]", views: backButton)
//        addConstraintsWithFormat(format: "H:[v0]|", views: passButton)
//        addConstraintsWithFormat(format: "H:[v0]|", views: startButton)
//        
//        addConstraintsWithFormat(format: "V:|[v0][v1]|", views: headerLabel, footerLabel)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: returnButton)
//        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 30)-[v0]-(>=5)-[v1(\(cardsViewHeight))]-\(Screen.sideInset)-[v2(40)]-\(Screen.sideInset)-|", views: headerContainer, cardsView, buttonsContainer)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: backButton)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: passButton)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: startButton)
//    }
//    
//}
