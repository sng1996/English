//
//  InboxScrollView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxScrollView: UIScrollView {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        contentInset.bottom = ViewController.tabBarView.height + 20
        showsVerticalScrollIndicator = false
        contentInsetAdjustmentBehavior = .never
        alwaysBounceVertical = true
        backgroundColor = .white
    }
    
    func fix(at position: CGFloat) {
        contentOffset.y = -position
        contentInset.top = position
        isScrollEnabled = position == 0
    }

}
