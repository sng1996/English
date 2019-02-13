//
//  StartExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension StartView {
    
    func back() {
        ViewController.tabBarView.show()
        self.removeFromSuperview()
    }
    
    func openChoosingView() {
        delegate.openChoosingView(sourceItem as! [WordData])
        self.removeFromSuperview()
    }
    
    func cardsViewDataSource() -> [WordData] {
        return sourceItem as! [WordData]
    }
    
    func showHeaderContainer() {
        headerLabel.isHidden = false
        footerLabel.isHidden = false
    }
    
    func hideHeaderContainer() {
        headerLabel.isHidden = true
        footerLabel.isHidden = true
    }
    
    func showReturnButton() {
        returnButton.isHidden = false
    }
    
    func hideReturnButton() {
        returnButton.isHidden = true
    }
    
    func hidePassButton() {
        passButton.isHidden = true
    }
    
    func showStartButton() {
        startButton.isHidden = false
    }
    
}
