//
//  SingleThemeSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 28/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension SingleThemeView {

    func setupViews() {
        addButton.tapHandler = add
        backButton.tapHandler = close
        tv.delegate = self
        tv.dataSource = self
        
        addSubview(scrollView)
        addSubview(backButton)
        addSubview(addButton)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(headerLabel)
        scrollContainer.addSubview(footerLabel)
        scrollContainer.addSubview(tv)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
        addConstraintsWithFormat(format: "H:[v0]-\(Screen.sideInset)-|", views: addButton)
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset)-|", views: backButton)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset)-|", views: addButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|-\(Screen.sideInset + 40)-[v0]-3-[v1]-20-[v2]|", views: headerLabel, footerLabel, tv)
        
        tvHeightAnchor = tv.heightAnchor.constraint(equalToConstant: 100)
        tvHeightAnchor.isActive = true
    }

}
