//
//  RepeatsGrayHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsGrayHintView: UIView {

    let label = UILabel(
        text: "Слова, отмеченные серым нужно будет повторить завтра",
        color: UIColor(rgb: 0x454545),
        font: UIFont.book(18)
    )
    
    let button = RepeatsGrayButton()
    
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
        container.addSubview(label)
        container.addSubview(button)
        
        let width = 261 * Screen.widthCoef
        
        addConstraintsWithFormat(format: "H:|-15-[v0(22)]", views: tailImageView)
        addConstraintsWithFormat(format: "H:|[v0(\(width))]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0][v1(11)]|", views: container, tailImageView)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: label)
        addConstraintsWithFormat(format: "H:|-20-[v0]", views: button)
        addConstraintsWithFormat(format: "V:|-25-[v0]-15-[v1]-20-|", views: label, button)
    }

}
