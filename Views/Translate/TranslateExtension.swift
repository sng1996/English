//
//  TranslateExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension TranslateView {

    func playSound() {
        
    }
    
    func open(_ wordData: WordData) {
        let word = Word(wordData)
        sourceItem = word
        topConstraint.isActive = false
        bottomConstraint.isActive = true
        bottomConstraint.constant = 0
        layoutIfNeeded()
        ViewController.tabBarView.isHidden = true
        delegate.didOpenTranslateView()
    }
    
    func close() {
        bottomConstraint.isActive = false
        topConstraint.isActive = true
        ViewController.tabBarView.isHidden = false
        removeButtons()
        delegate.didCloseTranslateView()
    }
    
    func createButtons() {
        removeButtons()
        let deleteButton = TranslateDeleteButton()
        deleteButton.tapHandler = deleteWord
        buttonsContainer.addSubview(deleteButton)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: deleteButton)
    }
    
    func removeButtons() {
        for view in buttonsContainer.subviews {
            view.removeFromSuperview()
        }
    }
    
    func deleteWord() {
        if let wordData = (sourceItem as! Word).data {
            WordDataManager.instance.delete(wordData)
            close()
        }
    }
    
    @objc
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        switch(gesture.state) {
        case UIGestureRecognizer.State.began:
            break
            
        case UIGestureRecognizer.State.changed:
            let translation = gesture.translation(in: self)
            if translation.y >= 0 {
                bottomConstraint.constant = translation.y
                layoutIfNeeded()
            }
            break
            
        case UIGestureRecognizer.State.ended:
            let translation = gesture.translation(in: self)
            if translation.y > 30 {
                close()
            }
            if translation.y < -30 {
                createButtons()
            }
            break
            
        default: break
        }
    }

}
