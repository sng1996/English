//
//  AddHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddHintView: UIView {

    let label = UILabel(
        text: "Вы можете добавлять как русские так и английские слова.",
        color: UIColor(rgb: 0x454545),
        font: UIFont.book(18)
    )
    
    let tailImageView = ImageView(name: "TailUp_white")
    
    let languagesImageView = ImageView(name: "Languages")
    
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
        container.addSubview(label)
        container.addSubview(languagesImageView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0(11)][v1]|", views: tailImageView, container)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-[v1]-20-|", views: languagesImageView, label)
        addConstraintsWithFormat(format: "V:|-20-[v0(>=53)]-20-|", views: label)

        NSLayoutConstraint.activate([
            tailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            languagesImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tailImageView.widthAnchor.constraint(equalToConstant: 22),
        ])
    }
}
