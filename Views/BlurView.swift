//
//  BlurView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import DynamicBlurView
import UIKit

class BlurView: DynamicBlurView {
    
    let container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0x000000, a: 0.02)
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.blurRadius = 8
        self.alpha = 0.0
        setupViews()
    }
    
    func setupViews() {
        addSubview(container)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: container)
        addConstraintsWithFormat(format: "V:[v0(\(2 * Screen.height))]|", views: container)
    }
    
    func updateOpacity(with constant: CGFloat) {
        alpha = constant
        container.alpha = constant
    }
    
}

