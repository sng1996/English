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
    
    func open(with model: TranslateViewDataModel) {
        sourceItem = model
        isHidden = false
        ViewController.tabBarView.hide()
        topConstraint.constant = -view.frame.height
        animateLayout()
    }
    
    func close() {
        optionsButton.isHidden = false
        topConstraint.constant = 0
        ViewController.tabBarView.show()
        delegate.didCloseTranslateView()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.superview!.layoutIfNeeded()
        }, completion: { finished in
            self.isHidden = true
        })
    }
    
    func deleteWord() {
        if let wordData = (sourceItem as! Word).data {
            wordDataService.delete(wordData)
            close()
            delegate.updateScreen()
        }
    }
    
    func openButtons() {
        optionsButton.isHidden = true
    }
    
    func animateLayout() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.superview!.layoutIfNeeded()
        }, completion: { finished in })
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        switch(gesture.state) {
        case UIGestureRecognizer.State.began:
            maxY = -view.frame.height
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
            if maxY < topConstraint.constant {
                close()
            }
            break
            
        default: break
        }
    }

}
