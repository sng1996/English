////
////  NewThemeActions.swift
////  English
////
////  Created by Сергей Гаврилко on 15/02/2019.
////  Copyright © 2019 gavrilko. All rights reserved.
////
//
//import UIKit
//
//extension NewThemeView {
//    
//    func add() {
//        if addButton.isOpen {
//            delegate.presentInbox()
//            removeFromSuperview()
//            return
//        }
//        vm.addActiveWords()
//        tv.reloadData()
//        addButton.isOpen = true
//        if let theme = vm.theme {
//            footerLabel.text = theme.getCounts()
//        }
//    }
//    
//    func open(_ view: ThemesCardView) {
//        let rect = convert(view.imageView.frame, from: view)
//        currentImageViewFrame = rect
//        imageViewConstraintsTo(rect: rect)
//        
//        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
//            self.imageViewConstraintsToDefault()
//            self.showAllObjects()
//        }, completion: { finished in
//            self.tvHeightAnchor.constant = self.tv.contentSize.height
//            self.layoutIfNeeded()
//            self.imageViewAttachToScrollTop()
//        })
//    }
//    
//    func close() {
////        delegate.viewDidAppear()
////        guard let rect = currentImageViewFrame else { return }
////        imageViewDetachFromScrollTop()
////        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
////            self.imageViewConstraintsTo(rect: rect)
////            self.hideAllObjects()
////        }, completion: { finished in
////            self.removeFromSuperview()
////        })
//        delegate.viewDidAppear()
//        removeFromSuperview()
//    }
//    
//    func imageViewConstraintsTo(rect: CGRect) {
//        imageViewLeftAnchor.constant = rect.origin.x
//        imageViewTopAnchor.constant = rect.origin.y
//        imageViewWidthAnchor.constant = rect.width
//        imageViewHeightAnchor.constant = rect.height
//        layoutIfNeeded()
//    }
//    
//    func imageViewConstraintsToDefault() {
//        imageViewLeftAnchor.constant = 0
//        imageViewTopAnchor.constant = 0
//        imageViewWidthAnchor.constant = Screen.width
//        imageViewHeightAnchor.constant = imageSize.height
//        layoutIfNeeded()
//    }
//    
//    func imageViewAttachToScrollTop() {
//        imageViewTopAnchor.isActive = false
//        imageViewTopScrollAnchor.isActive = true
//    }
//    
//    func imageViewDetachFromScrollTop() {
//        imageViewTopScrollAnchor.isActive = false
//        imageViewTopAnchor.isActive = true
//    }
//    
//    func showAllObjects() {
//        imageView.layer.cornerRadius = 0
//        backButton.alpha = 1.0
//        backgroundColor = UIColor(rgb: 0xFFFFFF)
//        headerLabel.alpha = 1.0
//        tv.alpha = 1.0
//    }
//    
//    func hideAllObjects() {
//        imageView.layer.cornerRadius = 5
//        backButton.alpha = 0.0
//        backgroundColor = UIColor(rgb: 0xFFFFFF, a: 0.0)
//        headerLabel.alpha = 0.0
//        tv.alpha = 0.0
//    }
//    
//    func presentInbox() {
//        delegate.presentInbox()
//        removeFromSuperview()
//    }
//
//}
