//
//  SpellingButton.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SpellingButton: Button {
    
    let showLabel = UILabel(
        text: "Показать ответ",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.medium(18),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        self.frame.size.height = 40.0
        setupViews()
    }
    
    func setupViews() {
        addSubview(showLabel)
        
        translatesAutoresizingMaskIntoConstraints = false
        showLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            showLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
