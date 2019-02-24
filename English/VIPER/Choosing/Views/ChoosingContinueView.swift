//
//  ChoosingContinueView.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class ChoosingContinueView: UIView {

    let label = UILabel(
        text: "Продолжить",
        color: CellColors.red,
        font: UIFont.medium(18)
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(rgb: 0xFFFFFF, a: 0.8)
        self.alpha = 0.0
        setupViews()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|-15-[v0]-15-|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
    }
    
    func show() {
        self.alpha = 1.0
    }
    
}
