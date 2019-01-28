//
//  TranslateOptionsButton.swift
//  English
//
//  Created by Сергей Гаврилко on 17/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateOptionsButton: Button {

    let roundsView = RoundsView()
    
    let line = Line()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        addSubview(roundsView)
        addSubview(line)
        
        roundsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roundsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            roundsView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: line)
        addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
    }

}
