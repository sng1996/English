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
        view.backgroundColor = UIColor(rgb: 0x68DBA5)
        view.layer.cornerRadius = 5
        view.layer.setShadow(color: UIColor(rgb: 0x68DBA5))
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let imageView = ImageView(name: "RightArrow_white")
    
    let width = (Screen.width - 20) / 5
    let side: CGFloat = 40
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        alpha = 0.0
        setupViews()
    }
    
    func setupViews() {
        addSubview(view)
        view.addSubview(imageView)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: side),
            view.heightAnchor.constraint(equalToConstant: side),
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 11),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
}
