//
//  WrongButton.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class WrongButton: Button {
    
    let label = UILabel(
        text: "Ок!",
        color: .white,
        font: UIFont.medium(14)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let height: CGFloat = 30
    
    override init() {
        super.init()
        backgroundColor = UIColor(rgb: 0x53D397)
        layer.cornerRadius = height / 2
        layer.setShadow(
            color: UIColor(rgb: 0x53D397),
            offset: CGSize(width: 0, height: 3),
            opacity: 0.1,
            radius: 6
        )
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-30-[v0]-30-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(\(height))]|", views: label)
    }
    
}
