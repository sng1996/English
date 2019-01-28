//
//  InboxEmptyView.swift
//  English
//
//  Created by Сергей Гаврилко on 17/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxEmptyView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "EmptyInbox"))
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    let headerLabel = UILabel(
        text: "Список пуст",
        color: UIColor(rgb: 0x5A5A5A),
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        text: "Чтобы добавить своё слово\nили фразу, потяни\nэкран вниз",
        color: UIColor(rgb: 0xAEADAD),
        font: UIFont.book(20),
        alignment: .center
    )
    
    let imageSize = CGSize(
        width: Screen.width,
        height: 342 * Screen.widthCoef
    )
    
    let footerPadding = 60 * Screen.widthCoef
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        addSubview(imageView)
        addSubview(headerLabel)
        addSubview(footerLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: imageView)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 50 * Screen.heightCoef)-[v0(\(imageSize.height))]", views: imageView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(footerPadding)-[v0]-\(footerPadding)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 50 * Screen.heightCoef)-[v0]-10-[v1]", views: headerLabel, footerLabel)
    }
    
}
