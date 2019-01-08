//
//  RepeatsSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsView {
    
    func setupViews() {
        archiveButton.tapHandler = openArchiveView
        translateView.delegate = self
        cv.delegate = self
        cv.dataSource = self
        
        addSubview(scrollView)
        addSubview(translateView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(topContainer)
        scrollContainer.addSubview(cv)
        topContainer.addSubview(label)
        topContainer.addSubview(archiveButton)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
        translateView.bottomConstraint = translateView.bottomAnchor.constraint(equalTo: bottomAnchor)
        translateView.topConstraint = translateView.topAnchor.constraint(equalTo: bottomAnchor)
        translateView.topConstraint.isActive = true
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0][v1]|", views: topContainer, cv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: label, archiveButton)
        addConstraintsWithFormat(format: "V:|[v0]-20-|", views: archiveButton)
        label.centerYAnchor.constraint(equalTo: archiveButton.centerYAnchor, constant: -2).isActive = true
        
        cvHeightAnchor = cv.heightAnchor.constraint(equalToConstant: 100)
        cvHeightAnchor.isActive = true
    }
    
}
