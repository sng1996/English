//
//  RepeatsCell.swift
//  English
//
//  Created by Сергей Гаврилко on 20/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsCellDataModel {
    
    var original: String
    var translate: String
    var repeats: Int
    
    init(_ word: WordData) {
        original = word.original
        translate = word.translate
        repeats = word.count
    }
    
}

class RepeatsCell: UITableViewCell {

    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? RepeatsCellDataModel else { return }
            headerLabel.text = model.original
            footerLabel.text = model.translate
            repeatProgressBar.sourceItem = model.repeats
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
    
    var isActive: Bool = true {
        didSet {
            if isActive {
                activate()
            } else {
                deactivate()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
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
    
    private func activate() {
        headerLabel.textColor = UIColor(rgb: 0x030303)
        footerLabel.textColor = UIColor(rgb: 0xDADADA)
    }
    
    private func deactivate() {
        headerLabel.textColor = UIColor(rgb: 0xE1E1E1)
        footerLabel.textColor = UIColor(rgb: 0xF5F5F5)
    }

}
