//
//  ThousandCell.swift
//  English
//
//  Created by Сергей Гаврилко on 07/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThousandCell: UICollectionViewCell {
    
    var sourceItem: Any? {
        didSet {
            guard let text = sourceItem as? String else { return }
            label.text = text
            isActive = false
        }
    }
    
    let container = UIView()
    
    let label = UILabel(
        color: UIColor(rgb: 0x8B8B8B),
        font: UIFont.book(22)
    )
    
    let height: CGFloat = 50.0
    
    var isActive = false {
        didSet {
            if isActive {
                backgroundColor = UIColor(rgb: 0x53D397)
                label.textColor = .white
            } else {
                backgroundColor = UIColor(rgb: 0xF7F7F7)
                label.textColor = UIColor(rgb: 0x8B8B8B)
            }
        }
    }
    
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
        self.backgroundColor = UIColor(rgb: 0xF7F7F7)
        self.layer.cornerRadius = height / 2
        
        contentView.addSubview(container)
        container.addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0(>=1)]|", views: container)
        addConstraintsWithFormat(format: "V:|[v0(>=1)]|", views: container)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0(\(height))]|", views: label)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
