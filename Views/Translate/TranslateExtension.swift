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
        if let word = sourceItem as? Word {
            speechManager.play(word.original)
        }
    }
    
    func open(_ wordData: WordData) {
        let word = Word(wordData)
        sourceItem = word
        
        self.topConstraint.constant = -self.buttonsContainer.frame.minY
        animateLayout()
        
        ViewController.tabBarView.isHidden = true
        delegate.didOpenTranslateView()
    }
    
    func close() {
        topConstraint.constant = 0
        animateLayout()
        ViewController.tabBarView.isHidden = false
        delegate.didCloseTranslateView()
    }
    
    func deleteWord() {
        if let wordData = (sourceItem as! Word).data {
            wordDataService.delete(wordData)
            close()
        }
    }
    
    func animateLayout() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.superview!.layoutIfNeeded()
        }, completion: { finished in })
    }
    
    @objc
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        switch(gesture.state) {
        case UIGestureRecognizer.State.began:
            maxY = -self.frame.height
            currentY = topConstraint.constant
            break
            
        case UIGestureRecognizer.State.changed:
            let translation = gesture.translation(in: self)
            let constant = currentY + translation.y
            if maxY <= constant {
                topConstraint.constant = constant
            }
            layoutIfNeeded()
            break
            
        case UIGestureRecognizer.State.ended:
            if topConstraint.constant < -buttonsContainer.frame.minY {
                topConstraint.constant = maxY
                animateLayout()
            } else {
                close()
            }
            break
            
        default: break
        }
    }

}
