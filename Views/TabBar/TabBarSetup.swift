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
        buttons[2].tapHandler = didTapThemes
        buttons[3].tapHandler = didTapSettings
        startButton.tapHandler = didTapStart
        
        addSubview(stackView)
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        addSubview(startButton)
        
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: stackView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: stackView)
        addConstraintsWithFormat(format: "V:[v0(\(height))]", views: self)
        addConstraintsWithFormat(format: "H:[v0]|", views: startButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: startButton)
    }
    
    func setupShadows() -> [Shadow] {
        let shadow1 = Shadow(
            color: UIColor(rgb: 0x0F0F0F),
            offset: .zero,
            opacity: 0.01,
            radius: 0
        )
        let shadow2 = Shadow(
            color: UIColor(rgb: 0x24B43F),
            offset: CGSize(width: 0, height: 3),
            opacity: 0.1,
            radius: 6
        )
        let shadow3 = Shadow(
            color: UIColor(rgb: 0x176630),
            offset: CGSize(width: 0, height: 4),
            opacity: 0.0521,
            radius: 9
        )
        return [shadow1, shadow2, shadow3]
    }

}
