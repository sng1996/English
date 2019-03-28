//
//  BackButton.swift
//  English
//
//  Created by Сергей Гаврилко on 26/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class BackButton: Button {

    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LeftArrow_black")!)
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        self.backgroundColor = .white
        self.layer.cornerRadius = 3
        self.layer.setShadow()
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 10),
            imageView.heightAnchor.constraint(equalToConstant: 17),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
