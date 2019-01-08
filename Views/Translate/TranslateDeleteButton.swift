//
//  TranslateDeleteButton.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class TranslateDeleteButton: Button {
    
    let label = UILabel(
        text: "Удалить",
        color: UIColor(rgb: 0xF95454),
        font: UIFont.medium(20),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(40)]|", views: label)
    }
    
}
