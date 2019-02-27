////
////  NewThemeSetup.swift
////  English
////
////  Created by Сергей Гаврилко on 15/02/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension NewThemeView {
//
//    func setupViews() {
//        tv.delegate = self
//        tv.dataSource = self
//        addButton.tapHandler = add
//        backButton.tapHandler = close
//        
//        hideAllObjects()
//        
//        addSubview(scrollView)
//        addSubview(backButton)
//        addSubview(addButton)
//        scrollView.addSubview(scrollContainer)
//        scrollContainer.addSubview(imageView)
//        scrollContainer.addSubview(headerLabel)
//        scrollContainer.addSubview(footerLabel)
//        scrollContainer.addSubview(tv)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
//        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset)-|", views: backButton)
//        
//        addConstraintsWithFormat(format: "H:[v0]-\(Screen.sideInset)-|", views: addButton)
//        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset)-|", views: addButton)
//        
//        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: tv)
//        addConstraintsWithFormat(format: "V:[v0]-30-[v1]-10-[v2]-20-[v3]|", views: imageView, headerLabel, footerLabel, tv)
//        
//        imageViewLeftAnchor = imageView.leftAnchor.constraint(equalTo: leftAnchor)
//        imageViewTopAnchor = imageView.topAnchor.constraint(equalTo: topAnchor)
//        imageViewTopScrollAnchor = imageView.topAnchor.constraint(equalTo: scrollContainer.topAnchor)
//        imageViewWidthAnchor = imageView.widthAnchor.constraint(equalToConstant: 0)
//        imageViewHeightAnchor = imageView.heightAnchor.constraint(equalToConstant: 0)
//        tvHeightAnchor = tv.heightAnchor.constraint(equalToConstant: 1000)
//        
//        NSLayoutConstraint.activate([
//            imageViewLeftAnchor,
//            imageViewTopAnchor,
//            imageViewWidthAnchor,
//            imageViewHeightAnchor,
//            tvHeightAnchor
//        ])
//    }
//
//}
