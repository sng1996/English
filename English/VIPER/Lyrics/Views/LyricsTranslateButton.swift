//
//  LyricsTranslateButton.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LyricsTranslateButton: Button {

    let label = UILabel(
        text: "Перевести",
        color: .white,
        font: UIFont.medium(18)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor(rgb: 0x53D397)
        layer.cornerRadius = 3
        layer.setShadow(color: UIColor(rgb: 0x53D397))
        
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(40)]|", views: label)
    }

}
