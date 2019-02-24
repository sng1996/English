//
//  StartPassButton.swift
//  English
//
//  Created by Сергей Гаврилко on 26/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class StartPassButton: Button {

    let label = UILabel(
        text: "Пропустить",
        color: UIColor(rgb: 0xC8C8C8),
        font: UIFont.medium(20),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        self.backgroundColor = .clear
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(40)]|", views: label)
    }

}
