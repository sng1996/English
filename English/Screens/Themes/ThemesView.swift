//
//  ThemesView.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class ThemesView: UIView {
    
    let label = UILabel(
        text: "Themes",
        color: .gray,
        font: UIFont.medium(48),
        alignment: .center
    )
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
    func viewDidAppear() {
        ViewController.tabBarView.hideStartButton()
    }
    
    func setupViews() {
        addSubview(label)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: label)
        addConstraintsWithFormat(format: "V:|[v0]|", views: label)
    }
    
}

//class ThemesView: UIView {
//
//    let scrollView = ScrollView()
//
//    let scrollContainer = UIView()
//
//    let headerLabel = UILabel(
//        text: "Наборы",
//        font: UIFont.book(36)
//    )
//
//    let footerLabel = UILabel(
//        text: "Слова и фразы, объединенные единой тематикой либо ситуацией",
//        color: UIColor(rgb: 0x9B9B9B),
//        font: UIFont.book(20)
//    )
//
//    let vm = ThemesViewModel()
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero)
//        self.backgroundColor = .white
//        setupViews()
//    }
//
//    func viewDidAppear() {
//        ViewController.tabBarView.hideStartButton()
//    }
//
//}
