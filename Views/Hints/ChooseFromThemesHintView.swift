//
//  ChooseFromThemesHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChooseFromThemesHintView: UIView {

    let imageView = ImageView(name: "Conversation")
    
    let label = UILabel(
        text: "Либо выберите слова из готовых наборов!",
        color: UIColor(rgb: 0x454545),
        font: UIFont.book(18)
    )
    
    let tailImageView = ImageView(name: "Tail_white")
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.setShadow(
            color: UIColor(rgb: 0xB4B4B4),
            offset: CGSize(width: 0, height: 13),
            opacity: 0.25,
            radius: 18
        )
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        addSubview(tailImageView)
        addSubview(container)
        container.addSubview(imageView)
        container.addSubview(label)
        
        let width = 299 * Screen.widthCoef
        
        addConstraintsWithFormat(format: "H:|-20-[v0(50)]-20-[v1]-20-|", views: imageView, label)
        
        addConstraintsWithFormat(format: "H:|[v0(\(width))]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0(93)][v1]|", views: container, tailImageView)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 53),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            tailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

}
