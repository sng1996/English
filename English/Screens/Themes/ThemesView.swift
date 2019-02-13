//
//  ThemesView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class ThemesView: UIView, ServiceProvider {

    let scrollView = ScrollView(inset: 0)

    let scrollContainer = UIView()

    let headerLabel = UILabel(
        text: "Наборы",
        font: UIFont.book(36)
    )

    let footerLabel = UILabel(
        text: "Слова и фразы, объединенные единой тематикой либо ситуацией",
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20)
    )
    
    let tv = ThemesTableView()
    
    var cellViews: [ThemesCellView] = []
    var tvHeightAnchor: NSLayoutConstraint!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
        viewDidAppear()
    }

    func viewDidAppear() {
        ViewController.tabBarView.hideStartButton()
        ViewController.tabBarView.show()
        update()
    }

}
