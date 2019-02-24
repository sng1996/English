//
//  RepeatsHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsHintView: UIView {

    let label = UILabel(
        text: "Для полного закрепления повторите слово 3 раза",
        color: UIColor(rgb: 0x454545),
        font: UIFont.book(18)
    )
    
    let tailImageView = ImageView(name: "TailRight_white")
    
    let button = RepeatsButton()
    
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
        addSubview(button)
        container.addSubview(label)
        
        let width = 237 * Screen.widthCoef

        addConstraintsWithFormat(format: "H:[v0(\(width))][v1(11)]-60-|", views: container, tailImageView)

        addConstraintsWithFormat(format: "V:|-115-[v0]->=10-[v1]-60-|", views: container, button)
        
        addConstraintsWithFormat(format: "H:|-25-[v0]-25-|", views: label)
        addConstraintsWithFormat(format: "V:|-20-[v0]-20-|", views: label)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            tailImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            tailImageView.heightAnchor.constraint(equalToConstant: 22),
        ])
    }

}
