//
//  AddSelfCell.swift
//  English
//
//  Created by Сергей Гаврилко on 08/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddSelfCell: UITableViewCell {
    
    let plusImageView = UIImageView(image: UIImage(named: "Plus_gray")!)
    
    let label = UILabel(
        text: "Добавить свой перевод",
        color: UIColor(rgb: 0xCBCBCB),
        font: UIFont.book(16)
    )
    
    let line = Line()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        addSubview(plusImageView)
        addSubview(label)
        addSubview(line)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0(14)]-10-[v1]-\(Screen.sideInset)-|", views: plusImageView, label)
        addConstraintsWithFormat(format: "V:|-20-[v0(14)]-20-|", views: plusImageView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: line)
        addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
    }

}
