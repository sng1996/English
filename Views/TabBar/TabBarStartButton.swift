//
//  TabBarStartButton.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class TabBarStartButton: Button {
    
    let view: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.setShadow(color: UIColor(rgb: 0x53D397))
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "RightArrow_green")!)
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        setupViews()
    }
    
    func setupViews() {
        addSubview(view)
        view.addSubview(imageView)
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: view)
        addConstraintsWithFormat(format: "V:|-10-[v0]-10-|", views: view)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 11),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
