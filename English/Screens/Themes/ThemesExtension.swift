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
        let newThemeView = NewThemeView()
        newThemeView.delegate = self
        addSubview(newThemeView)

        addConstraintsWithFormat(format: "H:|[v0]|", views: newThemeView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: newThemeView)

        newThemeView.sourceItem = cardView
    }
    
    func presentInbox() {
        MainViewController.tabBarView.show()
        MainViewController.tabBarView.buttons[0].didTap()
    }

}
