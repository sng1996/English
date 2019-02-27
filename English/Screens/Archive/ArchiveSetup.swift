////
////  ArchiveSetup.swift
////  English
////
////  Created by Сергей Гаврилко on 28/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension ArchiveView {
//    
//    func setupViews() {
//        translateView.delegate = self
//        cv.delegate = self
//        cv.dataSource = self
//        backButton.tapHandler = back
//        
//        addSubview(scrollView)
//        addSubview(translateView)
//        addSubview(emptyView)
//        addSubview(backButton)
//        scrollView.addSubview(scrollContainer)
//        scrollContainer.addSubview(cv)
//        scrollContainer.addSubview(label)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
//        translateView.topConstraint = translateView.topAnchor.constraint(equalTo: bottomAnchor)
//        translateView.topConstraint.isActive = true
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: emptyView)
//        addConstraintsWithFormat(format: "V:[v0]-20-[v1]", views: label, emptyView)
//        
//        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: label)
//        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0]-20-[v1]|", views: label, cv)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]", views: backButton)
//        addConstraintsWithFormat(format: "V:[v0]-\(Screen.sideInset)-|", views: backButton)
//        
//        cvHeightAnchor = cv.heightAnchor.constraint(equalToConstant: 100)
//        cvHeightAnchor.isActive = true
//    }
//    
//}
