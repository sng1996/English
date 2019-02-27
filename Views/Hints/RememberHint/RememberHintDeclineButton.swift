//
//  RememberHintDeclineButton.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RememberHintDeclineButton: Button {

    let label = UILabel(
        text: "Отказаться",
        color: UIColor(rgb: 0xD7D7D7),
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
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(\(height))]|", views: label)
    }

}
