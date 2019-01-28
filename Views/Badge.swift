//
//  Badge.swift
//  English
//
//  Created by Сергей Гаврилко on 20/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class Badge: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let count = sourceItem as? Int else { return }
            if count == 0 {
                self.isHidden = true
            } else {
                self.isHidden = false
                label.text = "\(count)"
            }
        }
    }

    let label = UILabel(
        color: .white,
        font: UIFont.medium(16)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0x53D397)
        layer.cornerRadius = 12
        isUserInteractionEnabled = false
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-[v0]-|", views: label)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 24),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
