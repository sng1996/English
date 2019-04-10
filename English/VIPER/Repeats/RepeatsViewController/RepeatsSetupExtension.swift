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
        badge.isHidden = true
        
        tv.delegate = self
        tv.dataSource = self
        
        view.addSubview(scrollView)
        view.addSubview(emptyView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(topContainer)
        scrollContainer.addSubview(tv)
        topContainer.addSubview(label)
        topContainer.addSubview(badge)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: emptyView)
        view.addConstraintsWithFormat(format: "V:[v0][v1]", views: topContainer, emptyView)
        
        view.addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: topContainer)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        view.addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0][v1]|", views: topContainer, tv)
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]->=\(Screen.sideInset)-|", views: label)
        view.addConstraintsWithFormat(format: "V:|[v0]-20-|", views: label)
        
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            badge.leftAnchor.constraint(equalTo: label.rightAnchor),
            badge.bottomAnchor.constraint(equalTo: label.centerYAnchor)
        ])
        
        tv.setInitConstraint()
    }

}
