//
//  SingleThemeExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 28/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension SingleThemeView {

    func close() {
        removeFromSuperview()
        delegate.viewDidAppear()
    }
    
    func add() {
        if addButton.isOpen {
            delegate.presentInbox()
            removeFromSuperview()
            return
        }
        vm.addActiveWords()
        tv.reloadData()
        addButton.isOpen = true
        if let theme = vm.theme {
            footerLabel.text = theme.getCounts()
        }
    }

}
