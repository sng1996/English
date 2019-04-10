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
        view.backgroundColor = .white
        
        scrollView.delegate = self
        cv.delegate = self
        cv.dataSource = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainer)
        scrollView.addSubview(emptyView)
        scrollContainer.addSubview(labelContainer)
        scrollContainer.addSubview(cv)
        labelContainer.addSubview(label)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        view.addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        view.addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]", views: emptyView)
        view.addConstraintsWithFormat(format: "V:|[v0(\(Screen.height))]", views: emptyView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: labelContainer)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        view.addConstraintsWithFormat(format: "V:|-\(Screen.safeTop)-[v0(70)][v1]|", views: labelContainer, cv)
        
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]|", views: label)
        label.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        
        cv.setInitConstraint()
    }
    
}
