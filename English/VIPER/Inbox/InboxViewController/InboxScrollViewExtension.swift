//
//  InboxScrollViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension InboxViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let blurView = blurView else { return }
        let offset = scrollView.contentOffset.y * coef
        
        addView.updateBottomConstraint(with: -offset)
        
        if scrollView.contentOffset.y < 0 {
            blurView.updateOpacity(with: -offset / addView.height)
        }
        
        if offset < -addView.height {
            scrollView.contentOffset.y = -addView.height / coef
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard let blurView = blurView else { return }
        if Int(scrollView.contentOffset.y * coef) == Int(-addView.height) {
            self.scrollView.fix(at: addView.frame.height / coef)
            addView.updateConstraintsForOpenState()
            addView.activateHeader()
        } else {
            blurView.alpha = 0.0
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            createBlurView()
        }
    }
    
}
