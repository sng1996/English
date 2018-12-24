//
//  InboxScrollExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension InboxView: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let blurView = blurView else { return }
        
        addView.frame.origin.y = -scrollView.contentOffset.y - addView.frame.size.height + Screen.safeTop
        
        if scrollView.contentOffset.y < 0 {
            blurView.alpha = -scrollView.contentOffset.y / addView.frame.height
            blurView.container.alpha  = -scrollView.contentOffset.y / addView.frame.height
        }
        
        if scrollView.contentOffset.y < -addView.frame.height {
            scrollView.contentOffset.y = -addView.frame.height
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y == -addView.frame.height {
            fixScroll()
            addView.activateKeyboard()
        } else {
            if let blurView = blurView {
                blurView.alpha = 0.0
                blurView.container.alpha = 0.0
            }
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y == 0 {
            createBlurView()
        }
    }
    
    func fixScroll() {
        scrollView.contentOffset.y = -addView.frame.height
        scrollView.contentInset.top = addView.frame.height
        scrollView.isScrollEnabled = false
    }

}
