//
//  TabBarSetup.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension TabBarView {

    func setupViews() {
        buttons[0].tapHandler = didTapInbox
        buttons[1].tapHandler = didTapRepeats
        buttons[2].tapHandler = didTapModules
        buttons[3].tapHandler = didTapSettings
        startButton.tapHandler = didTapStart
        modulesView.delegate = self
        
        addSubview(stackView)
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        addSubview(line)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: line)
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: stackView)
        addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
        addConstraintsWithFormat(format: "V:|[v0(60)]", views: stackView)
        addConstraintsWithFormat(format: "V:[v0(\(height))]", views: self)
    }
    
    func setupModulesView() {
        closeModulesView.isHidden = true
        superview!.insertSubview(closeModulesView, belowSubview: self)
        superview!.insertSubview(modulesView, belowSubview: self)
        
        closeModulesView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideModulesView)))
        
        superview!.addConstraintsWithFormat(format: "H:|[v0]|", views: closeModulesView)
        superview!.addConstraintsWithFormat(format: "V:|[v0]|", views: closeModulesView)
        
        modulesView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modulesView.centerXAnchor.constraint(equalTo: buttons[2].centerXAnchor),
            modulesView.widthAnchor.constraint(equalToConstant: 200),
            modulesView.heightAnchor.constraint(equalToConstant: 70),
            modulesView.bottomAnchor.constraint(equalTo: topAnchor, constant: -10)
        ])
    }

}
