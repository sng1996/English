//
//  AddCell.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class AddCell: UITableViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let word = sourceItem as? Word else { return }
            headerLabel.text = word.original
            footerLabel.text = word.translate
        }
    }
    
    let headerLabel = UILabel(font: UIFont.book(18))
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xC4C4C4),
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
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(line)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|-10-[v0][v1]-10-|", views: headerLabel, footerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: line)
        addConstraintsWithFormat(format: "V:|[v0(1)]", views: line)
    }

}
