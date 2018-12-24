//
//  AddButtonSave.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class AddButtonSave: Button {
    
    let imageView = UIImageView(image: UIImage(named: "Save_green"))
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        self.backgroundColor = .white
        self.layer.cornerRadius = 3
        self.layer.setShadow(color: UIColor(rgb: 0x53D397))
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 40),
            heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 19),
            imageView.heightAnchor.constraint(equalToConstant: 19),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 1),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1)
        ])
    }
    
}
