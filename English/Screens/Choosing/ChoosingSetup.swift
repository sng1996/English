//
//  ChoosingSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension ChoosingView {
    
    func setupViews() {
        let cvHeight = 5 * 10 + 4 * cellSize.height
        
        cv.delegate = self
        cv.dataSource = self
        backButton.tapHandler = back
        nextStepButton.isHidden = true
        nextStepButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(finishStep)))
        
        addSubview(topContainer)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(cv)
        addSubview(nextStepButton)
        topContainer.addSubview(backButton)
        topContainer.addSubview(countLabel)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: topContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "H:|[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:[v0]|", views: countLabel)
        
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + Screen.safeTop)-[v0]-(>=\(Screen.sideInset))-[v1][v2(60)][v3(\(cvHeight))]-\(Screen.safeBottom)-|", views: topContainer, headerLabel, footerLabel, cv)
        addConstraintsWithFormat(format: "V:|[v0]|", views: backButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: countLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: nextStepButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nextStepButton)
    }
    
}
