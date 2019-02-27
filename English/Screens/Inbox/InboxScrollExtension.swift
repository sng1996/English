////
////  InboxScrollExtension.swift
////  English
////
////  Created by Сергей Гаврилко on 24/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension InboxView: UIScrollViewDelegate {
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        
//        guard let blurView = blurView else { return }
//
//        let offset = scrollView.contentOffset.y * coef
//        
//        addView.bottomConstraint.constant = -offset
//        layoutIfNeeded()
//        
//        if scrollView.contentOffset.y < 0 {
//            blurView.alpha = -offset / addView.frame.height
//            blurView.container.alpha  = -offset / addView.frame.height
//        }
//        
//        if offset < -addView.frame.height {
//            scrollView.contentOffset.y = -addView.frame.height / coef
//        }
//    }
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if Int(scrollView.contentOffset.y * coef) == Int(-addView.frame.height) {
//            fixScroll()
//            addView.activateHeader()
//        } else {
//            if let blurView = blurView {
//                blurView.alpha = 0.0
//            }
//        }
//    }
//    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y == 0 {
//            createBlurView()
//        }
//    }
//    
//    func fixScroll() {
//        addView.bottomConstraint.isActive = false
//        addView.topConstraint.isActive = true
//        scrollView.contentOffset.y = -addView.frame.height / coef
//        scrollView.contentInset.top = addView.frame.height / coef
//        scrollView.isScrollEnabled = false
//    }
//    
//    func scrollToInit() {
//        scrollView.contentOffset.y = 0
//        scrollView.contentInset.top = 0
//        scrollView.isScrollEnabled = true
//    }
//
//}
