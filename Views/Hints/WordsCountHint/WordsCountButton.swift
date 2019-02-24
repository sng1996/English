//
//  WordsCountButton.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class WordsCountButton: Button {

    let label = UILabel(
        text: "Ок!",
        color: .white,
        font: UIFont.medium(14)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        backgroundColor = UIColor(rgb: 0x53D397)
        layer.cornerRadius = 41
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
        
        label.centerYAnchor.constraint(equalTo: centerYAnchor)
        label.centerXAnchor.constraint(equalTo: centerXAnchor)
    }

}
