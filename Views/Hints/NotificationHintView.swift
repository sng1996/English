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
        
    }

}
