//
//  RepeatsExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension RepeatsView {
    
    func didOpenTranslateView() {
        scrollView.isScrollEnabled = false
        scrollView.backgroundColor = UIColor(rgb: 0xFBFBFB)
        tv.backgroundColor = UIColor(rgb: 0xFBFBFB)
        for cell in tv.visibleCells {
            cell.backgroundColor = UIColor(rgb: 0xFBFBFB)
        }
    }
    
    func didCloseTranslateView() {
        scrollView.backgroundColor = .white
        tv.backgroundColor = .white
        scrollView.isScrollEnabled = true
        updateScreen()
        for cell in tv.visibleCells {
            cell.backgroundColor = .white
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
        ViewController.tabBarView.isHidden = true
        let startView = StartView()
        startView.delegate = self
        addSubview(startView)
        
        let array = Array(wordDataService.repeatWords.prefix(wordDataService.todayCount))
        startView.sourceItem = Array(array.suffix(10))
        
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
