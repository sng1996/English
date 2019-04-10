//
//  LyricsAddButton.swift
//  English
//
//  Created by Сергей Гаврилко on 29/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LyricsAddButton: Button {

    let imageView = ImageView(name: "Plus_white")
    
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
        
        addSubview(imageView)
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 36),
            heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
