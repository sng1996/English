//
//  WrongHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class WrongHintView: UIView {

    let label = UILabel(
        text: "Если вы ответили неправильно, слово нужно будет написать еще раз",
        color: UIColor(rgb: 0x626262),
        font: UIFont.book(18),
        alignment: .center
    )
    
    let button = WrongButton()
    
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
        addSubview(container)
        container.addSubview(label)
        container.addSubview(button)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0]|", views: container)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: label)
        addConstraintsWithFormat(format: "V:|-20-[v0]-8-[v1]-15-|", views: label, button)

        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
