//
//  ThemesSecondSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 27/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension ThemesSecondView {

    func setupViews() {
        tv.delegate = self
        tv.dataSource = self
        backButton.tapHandler = close
        
        hideAllObjects()
        
        addSubview(scrollView)
        addSubview(backButton)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(imageView)
        scrollContainer.addSubview(headerLabel)
        scrollContainer.addSubview(tv)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset)-|", views: backButton)
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
        addConstraintsWithFormat(format: "V:[v0]-30-[v1]-20-[v2]|", views: imageView, headerLabel, tv)
        
        imageViewLeftAnchor = imageView.leftAnchor.constraint(equalTo: leftAnchor)
        imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: topAnchor)
        imageViewTopScrollAnchor = imageView.topAnchor.constraint(equalTo: scrollContainer.topAnchor)
        imageViewWidthAnchor = imageView.widthAnchor.constraint(equalToConstant: 0)
        imageViewHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: 0)
        tvHeightAnchor = tv.heightAnchor.constraint(equalToConstant: 1000)
        
        NSLayoutConstraint.activate([
            imageViewLeftAnchor,
            imageViewTopAnchor,
            imageViewWidthAnchor,
            imageViewHeightAnchor,
            tvHeightAnchor
        ])
    }

}
