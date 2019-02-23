//
//  RememberHintButton.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RememberHintButton: Button {

    let label = UILabel(
        text: "Напоминать",
        color: .white,
        font: UIFont.medium(18)
    )
    
    let height = 50 * Screen.heightCoef
    
    override init() {
        super.init()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = UIColor(rgb: 0x53D397)
        layer.cornerRadius = height / 2
        layer.setShadow(color: UIColor(rgb: 0x53D397))
        
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(\(height))]|", views: label)
    }

}
