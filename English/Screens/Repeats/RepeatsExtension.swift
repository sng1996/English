//
//  RepeatsExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsView {
    
    func didCloseTranslateView() {
        scrollView.isScrollEnabled = true
        cellsToBlack()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.scrollView.backgroundColor = .white
        }, completion: nil)
    }
    
    func cellsToGray() {
        for c in tv.visibleCells {
            let cell = c as! RepeatsCell
            UIView.transition(with: cell.headerLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
                cell.deactivate()
            }, completion: nil)
        }
    }
    
    func cellsToBlack() {
        for c in tv.visibleCells {
            let cell = c as! RepeatsCell
            UIView.transition(with: cell.headerLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
                cell.activate()
            }, completion: nil)
        }
    }
    
    func updateScreen() {
        tv.reloadData()
        if wordDataService.todayCount == 0 {
            ViewController.tabBarView.hideStartButton()
        } else {
            ViewController.tabBarView.showStartButton()
        }
        badge.sourceItem = wordDataService.todayCount
        
        if wordDataService.repeatWords.count == 0 {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
        }
    }
    
    func openStartView() {
        ViewController.tabBarView.hide()
        let startView = StartView()
        startView.delegate = self
        addSubview(startView)
        
        let array = Array(wordDataService.repeatWords.prefix(wordDataService.todayCount))
        startView.sourceItem = Array(array.suffix(10))
        
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
    
}
