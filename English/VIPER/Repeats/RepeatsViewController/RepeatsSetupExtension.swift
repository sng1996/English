//
//  RepeatsSetupExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsViewController {

    func setupViews() {
        tv.delegate = self
        tv.dataSource = self
        
        addSubview(scrollView)
        addSubview(emptyView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(topContainer)
        scrollContainer.addSubview(tv)
        topContainer.addSubview(label)
        topContainer.addSubview(badge)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: emptyView)
        addConstraintsWithFormat(format: "V:[v0][v1]", views: topContainer, emptyView)
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0][v1]|", views: topContainer, tv)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]->=\(Screen.sideInset)-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]-20-|", views: label)
        
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badge.leftAnchor.constraint(equalTo: label.rightAnchor),
            badge.bottomAnchor.constraint(equalTo: label.centerYAnchor)
        ])
        
        tv.setInitConstraint()
    }

}
