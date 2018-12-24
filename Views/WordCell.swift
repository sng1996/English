//
//  WordCell.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let text = sourceItem as? String else { return }
            label.text = text
        }
    }
    
    let container = UIView()
    
    let label = UILabel(font: UIFont.book(36))

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
        let maxWidth = Screen.width - 2 * Screen.sideInset - 20
        
        contentView.addSubview(container)
        container.addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0]|", views: container)
        addConstraintsWithFormat(format: "H:|[v0(<=\(maxWidth))]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }

}
