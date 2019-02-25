//
//  ForgetHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ForgetHintView: UIView {

    let label = UILabel(
        text: "Нажмите кнопку, если забыли перевод",
        color: UIColor(rgb: 0x454545),
        font: UIFont.book(18),
        alignment: .center
    )
    
    let tailImageView = ImageView(name: "TailDown_white")
    
    let button = ForgetButton()
    
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
        addSubview(tailImageView)
        container.addSubview(label)
        container.addSubview(button)
        
        let width = 237 * Screen.widthCoef
        
        addConstraintsWithFormat(format: "H:|[v0(\(width))]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0][v1(11)]|", views: container, tailImageView)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: label)
        addConstraintsWithFormat(format: "V:|-20-[v0]-10-[v1]-20-|", views: label)

        NSLayoutConstraint.activate([
            tailImageView.widthAnchor.constraint(equalToConstant: 22),
            tailImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            ])
    }

}
