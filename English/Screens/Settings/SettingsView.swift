//
//  SettingsView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SettingsView: UIView {
    
    let scrollView = ScrollView()
    
    let scrollContainer = UIView()

    let headerLabel = UILabel(
        text: "Настройки",
        font: UIFont.book(36)
    )
    
    let notificationContainer = SettingsNotificationContainer()
    
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
        addSubview(scrollView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(headerLabel)
        scrollContainer.addSubview(notificationContainer)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: notificationContainer)
        addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0]-30-[v1]|", views: headerLabel, notificationContainer)
    }

}
