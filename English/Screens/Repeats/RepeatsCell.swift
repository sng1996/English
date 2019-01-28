//
//  RepeatsCell.swift
//  English
//
//  Created by Сергей Гаврилко on 20/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsCell: UITableViewCell {

    var sourceItem: Any? {
        didSet {
            guard let word = sourceItem as? WordData else { return }
            headerLabel.text = word.original
            footerLabel.text = word.translate
            repeatProgressBar.sourceItem = Int(word.count)
        }
    }
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x030303),
        font: UIFont.medium(20)
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xDADADA),
        font: UIFont.book(20)
    )
    
    let repeatProgressBar = RepeatProgressBar()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    func setupViews() {
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(repeatProgressBar)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]-\(Screen.sideInset)-|", views: headerLabel, repeatProgressBar)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]", views: footerLabel, repeatProgressBar)
        addConstraintsWithFormat(format: "V:|-5-[v0]-2-[v1]-5-|", views: headerLabel, footerLabel)
        repeatProgressBar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func activate() {
        headerLabel.textColor = UIColor(rgb: 0x030303)
        footerLabel.textColor = UIColor(rgb: 0xDADADA)
    }
    
    func deactivate() {
        headerLabel.textColor = UIColor(rgb: 0xE1E1E1)
        footerLabel.textColor = UIColor(rgb: 0xF5F5F5)
    }

}
