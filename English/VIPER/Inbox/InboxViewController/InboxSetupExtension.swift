//
//  InboxSetupExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension InboxViewController {
    
    func setupViews() {
        backgroundColor = .white
        
        addView.delegate = self
        translateView.delegate = self
        scrollView.delegate = self
        cv.delegate = self
        cv.dataSource = self
        
        addSubview(scrollView)
        addSubview(addView)
        addSubview(translateView)
        scrollView.addSubview(scrollContainer)
        scrollView.addSubview(emptyView)
        scrollContainer.addSubview(labelContainer)
        scrollContainer.addSubview(cv)
        labelContainer.addSubview(label)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: translateView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: addView)
        addView.bottomConstraint = addView.bottomAnchor.constraint(equalTo: topAnchor, constant: 0)
        addView.topConstraint = addView.topAnchor.constraint(equalTo: topAnchor)
        addView.bottomConstraint.isActive = true
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]", views: emptyView)
        addConstraintsWithFormat(format: "V:|[v0(\(Screen.height))]", views: emptyView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: labelContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop)-[v0(70)][v1]|", views: labelContainer, cv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]|", views: label)
        label.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        
        cv.heightConstraint = cv.heightAnchor.constraint(equalToConstant: 100)
        cv.heightConstraint.isActive = true
    }
    
}
