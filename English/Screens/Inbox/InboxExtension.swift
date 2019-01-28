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
    
    func didOpenTranslateView() {
        scrollView.isScrollEnabled = false
        scrollView.backgroundColor = UIColor(rgb: 0xF3F3F3)
        cv.backgroundColor = UIColor(rgb: 0xF3F3F3)
    }
    
    func didCloseTranslateView() {
        scrollView.backgroundColor = .white
        cv.backgroundColor = .white
        scrollView.isScrollEnabled = true
        updateScreen()
    }
    
    func updateScreen() {
        cv.reloadData()
        if wordDataService.newWords.count == 0 {
            showEmptyView()
            ViewController.tabBarView.hideStartButton()
        } else {
            hideEmptyView()
            ViewController.tabBarView.showStartButton()
        }
    }
    
    func showEmptyView() {
        emptyView.isHidden = false
    }
    
    func hideEmptyView() {
        emptyView.isHidden = true
    }
    
    func openStartView() {
        ViewController.tabBarView.isHidden = true
        let startView = StartView()
        startView.delegate = self
        addSubview(startView)
        
        startView.sourceItem = Array(wordDataService.newWords.suffix(10))
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: startView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: startView)
    }
    
    func openChoosingView(_ words: [WordData]) {
        ViewController.tabBarView.isHidden = true
        let choosingView = ChoosingView()
        choosingView.delegate = self
        addSubview(choosingView)
        
        choosingView.sourceItem = words
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: choosingView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: choosingView)
    }
    
    func openSpellingView(_ words: [WordData]) {
        ViewController.tabBarView.isHidden = true
        let spellingView = SpellingView()
        spellingView.delegate = self
        addSubview(spellingView)
        
        spellingView.sourceItem = words
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: spellingView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: spellingView)
    }

}
