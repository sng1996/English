//
//  InboxExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension InboxView {

    func hideAddView() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.scrollToInit()
            if let blurView = self.blurView {
                blurView.alpha = 0.0
            }
        }, completion: { finished in
            self.removeBlurView()
        })
        updateScreen()
    }
    
    func didCloseTranslateView() {
        scrollView.isScrollEnabled = true
        cellsToBlack()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.scrollView.backgroundColor = .white
        }, completion: nil)
    }
    
    func cellsToGray() {
        for c in cv.visibleCells {
            let cell = c as! WordCell
            UIView.transition(with: cell.label, duration: 0.3, options: .transitionCrossDissolve, animations: {
                cell.label.textColor = UIColor(rgb: 0xDADADA)
            }, completion: nil)
        }
    }
    
    func cellsToBlack() {
        for c in cv.visibleCells {
            let cell = c as! WordCell
            UIView.transition(with: cell.label, duration: 0.3, options: .transitionCrossDissolve, animations: {
                cell.label.textColor = .black
            }, completion: nil)
        }
    }
    
    func updateScreen() {
        cv.reloadData()
        if wordDataService.newWords.count == 0 {
            showEmptyView()
            ViewController.tabBarView.hideStartButton()
        } else {
            hideEmptyView()
            ViewController.tabBarView.showStartButton()
            if !UserDefaults.standard.bool(forKey: UserDefaults.Keys.isShowInboxHint) {
                showHint()
            }
        }
    }
    
    func showEmptyView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func openStartView() {
        ViewController.tabBarView.hide()
        let startView = StartView()
        startView.delegate = self
        addSubview(startView)
        
        startView.sourceItem = Array(wordDataService.newWords.suffix(10))
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: startView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: startView)
    }
    
    func openChoosingView(_ words: [WordData]) {
        ViewController.tabBarView.hide()
        let choosingView = ChoosingView()
        choosingView.delegate = self
        addSubview(choosingView)
        
        choosingView.sourceItem = words
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: choosingView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: choosingView)
    }
    
    func openSpellingView(_ words: [WordData]) {
        ViewController.tabBarView.hide()
        let spellingView = SpellingView()
        spellingView.delegate = self
        addSubview(spellingView)
        
        spellingView.sourceItem = words
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: spellingView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: spellingView)
    }
    
    func showHint() {
        UserDefaults.standard.set(true, forKey: UserDefaults.Keys.isShowInboxHint)
        
        let view = InboxHint()
        addSubview(view)
        
        addConstraintsWithFormat(format: "H:[v0]-10-|", views: view)
        addConstraintsWithFormat(format: "V:[v0]-\(ViewController.tabBarView.height + 10)-|", views: view)
        
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(hideHint), userInfo: ["view": view], repeats: false)
    }
    
    @objc func hideHint(timer: Timer) {
        let userInfo = timer.userInfo as! [String: UIView]
        let view = userInfo["view"]
        view!.removeFromSuperview()
    }

}
