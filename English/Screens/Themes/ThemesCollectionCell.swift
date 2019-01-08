//
//  ThemesCollectionCell.swift
//  English
//
//  Created by Сергей Гаврилко on 01/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesCollectionCell: UICollectionViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let item = sourceItem as? SecondLevelTheme else { return }
            imageView.image = item.image
            headerLabel.text = item.header
            footerLabel.text = "Количество тем: \(item.themes.count)"
            
            
            
        }
    }
    
    let container = UIView()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let headerLabel = UILabel(
        font: UIFont.book(20),
        lines: 1
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.medium(14),
        lines: 1
    )
    
    let imageSize = CGSize(
        width: 193 * Screen.heightCoef,
        height: 218 * Screen.heightCoef
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(container)
        container.addSubview(imageView)
        container.addSubview(headerLabel)
        container.addSubview(footerLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0]|", views: container)
        
        addConstraintsWithFormat(format: "H:|[v0(\(imageSize.width))]|", views: imageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|[v0(\(imageSize.height))]-5-[v1]-4-[v2]|", views: imageView, headerLabel, footerLabel)
    }
    
}
