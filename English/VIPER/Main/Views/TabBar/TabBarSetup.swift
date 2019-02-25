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
        backgroundColor = .white
        layer.setShadow(offset: .zero, radius: 1)
        
        buttons[0].tapHandler = didTapInbox
        buttons[1].tapHandler = didTapRepeats
        buttons[2].tapHandler = didTapThemes
        buttons[3].tapHandler = didTapSettings
        startButton.tapHandler = didTapStart
        
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        
        addSubview(stackView)
        addSubview(startButton)
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: stackView)
        addConstraintsWithFormat(format: "V:|[v0(60)]", views: stackView)
        addConstraintsWithFormat(format: "V:[v0(\(height))]", views: self)
        addConstraintsWithFormat(format: "H:[v0]-10-|", views: startButton)
        addConstraintsWithFormat(format: "V:|[v0(60)]", views: startButton)
    }

}
