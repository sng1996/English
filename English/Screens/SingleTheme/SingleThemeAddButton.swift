//
//  SingleThemeAddButton.swift
//  English
//
//  Created by Сергей Гаврилко on 21/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SingleThemeAddButton: Button {

    let imageView = ImageView(name: "Plus_green")
    
    let badge = Badge()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        backgroundColor = .white
        layer.cornerRadius = 3
        layer.setShadow(color: UIColor(rgb: 0x24B43F))
        setupViews()
        set(count: 0)
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(badge)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        badge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40),
            badge.centerXAnchor.constraint(equalTo: rightAnchor),
            badge.centerYAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func set(count: Int) {
        badge.sourceItem = count
    }
    
}
