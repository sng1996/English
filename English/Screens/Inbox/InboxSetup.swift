////
////  InboxSetup.swift
////  English
////
////  Created by Сергей Гаврилко on 24/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension InboxView {
//
//    func setupViews() {
//        addView.delegate = self
//        translateView.delegate = self
//        scrollView.delegate = self
//        cv.delegate = self
//        cv.dataSource = self
//        
//        addSubview(scrollView)
//        addSubview(addView)
//        addSubview(translateView)
//        scrollView.addSubview(scrollContainer)
//        scrollView.addSubview(emptyView)
//        scrollContainer.addSubview(labelContainer)
//        scrollContainer.addSubview(cv)
//        labelContainer.addSubview(label)
//        
//        translatesAutoresizingMaskIntoConstraints = false
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: translateView)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: translateView)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: addView)
//        addView.bottomConstraint = addView.bottomAnchor.constraint(equalTo: topAnchor, constant: 0)
//        addView.topConstraint = addView.topAnchor.constraint(equalTo: topAnchor)
//        addView.bottomConstraint.isActive = true
//        
//        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
//        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
//        
//        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]", views: emptyView)
//        addConstraintsWithFormat(format: "V:|[v0(\(Screen.height))]", views: emptyView)
//        
//        addConstraintsWithFormat(format: "H:|[v0]|", views: labelContainer)
//        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
//        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop)-[v0(70)][v1]|", views: labelContainer, cv)
//        
//        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]|", views: label)
//        label.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
//        
//        cvHeightAnchor = cv.heightAnchor.constraint(equalToConstant: 100)
//        cvHeightAnchor.isActive = true
//    }
//    
//    func createBlurView() {
//        removeBlurView()
//        let blurView = BlurView()
//        blurView.frame = scrollView.bounds
//        scrollView.addSubview(blurView)
//        addView.blurView = blurView
//        self.blurView = blurView
//    }
//    
//    func removeBlurView() {
//        if let blurView = blurView {
//            blurView.removeFromSuperview()
//            self.blurView = nil
//            addView.blurView = nil
//        }
//    }
//
//}
