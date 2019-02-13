//
//  ArchiveExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 28/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension ArchiveView {
    
    func back() {
        ViewController.tabBarView.show()
        removeFromSuperview()
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
        if wordDataService.archiveWords.count == 0 {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
        }
    }

}
