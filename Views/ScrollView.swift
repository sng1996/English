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

    init() {
        super.init(frame: .zero)
        self.contentInset.bottom = ViewController.tabBarView.height
        self.showsVerticalScrollIndicator = false
        self.contentInsetAdjustmentBehavior = .never
        self.alwaysBounceVertical = true
        self.backgroundColor = .white
    }
    
}
