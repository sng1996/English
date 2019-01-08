//
//  CardView.swift
//  English
//
//  Created by Сергей Гаврилко on 26/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let wordData = sourceItem as? WordData else { return }
            headerLabel.text = wordData.original
            footerLabel.text = wordData.translate
        }
    }

    let headerLabel = UILabel(
        color: UIColor(rgb: 0x030303),
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xDADADA),
        font: UIFont.book(24),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layer.cornerRadius = 3
        self.isUserInteractionEnabled = true
        self.layer.setShadow(
            offset: .zero,
            opacity: 0.05,
            radius: 14
        )
        self.frame.size = CGSize(
            width: Screen.width - 2 * Screen.sideInset,
            height: 414 * Screen.heightCoef
        )
        setupViews()
    }
    
    func setupViews() {
        addSubview(headerLabel)
        addSubview(footerLabel)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|-(>=10)-[v0]", views: headerLabel)
        addConstraintsWithFormat(format: "V:[v0]-(>=10)-|", views: footerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            footerLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 10)
        ])
    }
    
}
