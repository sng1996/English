//
//  NotificationHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class NotificationHintView: UIView {
    
    let headerContainer = UIView()

    let imageView = ImageView(name: "WordyIcon")
    
    let nameLabel = UILabel(
        text: "WORDY",
        color: UIColor(rgb: 0x434343),
        font: UIFont.medium(14)
    )
    
    let timeLabel = UILabel(
        text: "2 мин. назад",
        color: UIColor(rgb: 0x888888),
        font: UIFont.book(14)
    )
    
    let headerLabel = UILabel(
        text: "Напоминание",
        color: UIColor(rgb: 0x434343),
        font: UIFont.medium(16)
    )
    
    let footerLabel = UILabel(
        text: "Слов на повторение сегодня: 7",
        color: UIColor(rgb: 0x434343),
        font: UIFont.book(18)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.setShadow(
            color: UIColor(rgb: 0xB4B4B4),
            offset: CGSize(width: 0, height: 13),
            opacity: 0.25,
            radius: 18
        )
        
        addSubview(headerContainer)
        addSubview(headerLabel)
        addSubview(footerLabel)
        headerContainer.addSubview(imageView)
        headerContainer.addSubview(nameLabel)
        headerContainer.addSubview(timeLabel)
        
        let sideInset = 14
        
        addConstraintsWithFormat(format: "H:|-\(sideInset)-[v0]-\(sideInset)-|", views: headerContainer)
        addConstraintsWithFormat(format: "H:|-\(sideInset)-[v0]-\(sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(sideInset)-[v0]-\(sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|-\(sideInset)-[v0]-8-[v1]-2-[v2]-\(sideInset)-|", views: headerContainer, headerLabel, footerLabel)
        
        addConstraintsWithFormat(format: "H:|[v0(27)]-7-[v1]->=15-[v2]|", views: imageView, nameLabel, timeLabel)
        addConstraintsWithFormat(format: "V:|[v0(27)]|", views: imageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: timeLabel)
    }

}
