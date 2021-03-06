//
//  InboxScrollView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxScrollView: UIScrollView {
    
    var isActive: Bool = true {
        didSet {
            if isActive {
                activate()
            } else {
                deactivate()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        showsVerticalScrollIndicator = false
        contentInsetAdjustmentBehavior = .never
        alwaysBounceVertical = true
    }
    
    func fix(at position: CGFloat) {
        contentOffset.y = -position
        contentInset.top = position
        isScrollEnabled = position == 0
    }
    
    private func activate() {
        isScrollEnabled = true
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.backgroundColor = .white
        }, completion: nil)
    }
    
    private func deactivate() {
        isScrollEnabled = false
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.backgroundColor = UIColor(rgb: 0xF3F3F3)
        }, completion: nil)
    }

}
