//
//  ThemesExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 01/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension ThemesView {

    func updateCellViews() {
        for view in cellViews {
            view.update()
        }
    }
    
    func update() {
        updateCellViews()
        tv.reloadData()
    }
    
    func open(cardView: ThemesCardView) {
        let themesSecondView = ThemesSecondView()
        themesSecondView.delegate = self
        addSubview(themesSecondView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: themesSecondView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: themesSecondView)
        
        themesSecondView.sourceItem = cardView
    }

}
