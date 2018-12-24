//
//  InboxSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension InboxView {

    func setupViews() {
        scrollView.delegate = self
        cv.delegate = self
        cv.dataSource = self
        
        addSubview(scrollView)
        addSubview(addView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(labelContainer)
        scrollContainer.addSubview(cv)
        labelContainer.addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: addView)
        addView.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: labelContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: cv)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop)-[v0(70)][v1]|", views: labelContainer, cv)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]|", views: label)
        label.centerYAnchor.constraint(equalTo: labelContainer.centerYAnchor).isActive = true
        
        cvHeightAnchor = cv.heightAnchor.constraint(equalToConstant: 100)
        cvHeightAnchor.isActive = true
    }
    
    func createBlurView() {
        removeBlurView()
        let blurView = BlurView()
        scrollView.addSubview(blurView)
        addView.blurView = blurView
        self.blurView = blurView
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: blurView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: blurView)
    }
    
    func removeBlurView() {
        if let blurView = blurView {
            blurView.removeFromSuperview()
            self.blurView = nil
            addView.blurView = nil
        }
    }

}
