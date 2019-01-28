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
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF9F9F9)
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(line)
        
        translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 13.5),
            imageView.heightAnchor.constraint(equalToConstant: 9),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            line.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            line.widthAnchor.constraint(equalToConstant: 1),
            line.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
}
