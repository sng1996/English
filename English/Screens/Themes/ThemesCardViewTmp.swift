//
//  ThemesCardViewTmp.swift
//  English
//
//  Created by Сергей Гаврилко on 26/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesCardViewTmp: UIView {
    
    let container = UIView()

    let imageView: ImageView = {
        let imageView = ImageView()
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let headerLabel = UILabel(
        font: UIFont.book(20),
        lines: 1,
        scale: 0.5
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xE6E6E6),
        font: UIFont.book(14),
        lines: 1
    )
    
    let imageSize = CGSize(
        width: 190 * Screen.widthCoef,
        height: 215 * Screen.widthCoef
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        addSubview(container)
        container.addSubview(imageView)
        container.addSubview(headerLabel)
        container.addSubview(footerLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0]|", views: container)
        
        addConstraintsWithFormat(format: "H:|[v0(\(imageSize.width))]|", views: imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|[v0(\(imageSize.height))]-15-[v1]-4-[v2]|", views: imageView, headerLabel, footerLabel)
    }

}
