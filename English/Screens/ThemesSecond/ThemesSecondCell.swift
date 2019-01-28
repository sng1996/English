//
//  ThemesSecondCell.swift
//  English
//
//  Created by Сергей Гаврилко on 27/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThemesSecondCell: UITableViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let theme = sourceItem as? Theme else { return }
            headerLabel.text = theme.name
            footerLabel.text = theme.getCounts()
        }
    }

    let container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.setShadow(
            offset: CGSize(width: 3, height: 3),
            opacity: 0.05
        )
        view.backgroundColor = .white
        return view
    }()
    
    let headerLabel = UILabel(
        color: UIColor(rgb: 0x4C4C4C),
        font: UIFont.book(28)
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xE6E6E6),
        font: UIFont.book(16)
    )
    
    let arrowImageView = ImageView(name: "RightArrow_gray")
    
    let line = Line()
    
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
        addSubview(container)
        container.addSubview(headerLabel)
        container.addSubview(arrowImageView)
        container.addSubview(line)
        container.addSubview(footerLabel)
        
        let inset = Screen.sideInset - 10
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: container)
        addConstraintsWithFormat(format: "V:|-7-[v0]-7-|", views: container)
        
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0]-\(inset)-[v1(9)]-\(inset)-|", views: headerLabel, arrowImageView)
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0]-\(inset)-|", views: line)
        addConstraintsWithFormat(format: "H:|-\(inset)-[v0]-\(inset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|-20-[v0]-14-[v1(1)]-16-[v2]-20-|", views: headerLabel, line, footerLabel)
        
        NSLayoutConstraint.activate([
            arrowImageView.centerYAnchor.constraint(equalTo: headerLabel.centerYAnchor),
            arrowImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }

}
