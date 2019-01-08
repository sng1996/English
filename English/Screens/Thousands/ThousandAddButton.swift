//
//  ThousandAddButton.swift
//  English
//
//  Created by Сергей Гаврилко on 07/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThousandAddButton: Button {

    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Plus_green"))
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        backgroundColor = .white
        layer.cornerRadius = 3
        layer.setShadow(color: UIColor(rgb: 0x53D397))
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
