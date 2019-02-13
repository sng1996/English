//
//  ScrollView.swift
//  English
//
//  Created by Сергей Гаврилко on 01/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ScrollView: UIScrollView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(inset: CGFloat = ViewController.tabBarView.height + 20) {
        super.init(frame: .zero)
        contentInset.bottom = inset
        showsVerticalScrollIndicator = false
        contentInsetAdjustmentBehavior = .never
        alwaysBounceVertical = true
        backgroundColor = .white
    }
    
}
