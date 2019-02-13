//
//  RoundView.swift
//  English
//
//  Created by Сергей Гаврилко on 08/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RoundView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(rgb: 0x767676)
        self.layer.cornerRadius = 2
        self.isUserInteractionEnabled = false
        setupViews()
    }
    
    func setupViews() {
        addConstraintsWithFormat(format: "H:[v0(4)]", views: self)
        addConstraintsWithFormat(format: "V:[v0(4)]", views: self)
    }
    
}
