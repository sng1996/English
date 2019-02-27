//
//  SettingsViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SettingsViewController: UIView {
    
    var presenter: SettingsPresenterProtocol!
    var configurator: SettingsConfiguratorProtocol = SettingsConfigurator()
    
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
        configurator.configure(with: self)
        setupViews()
        viewDidAppear()
    }
    
    func setupViews() {
        backgroundColor = .white
        
        notificationContainer.delegate = self
        
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
    
    func viewDidAppear() {
        presenter.configureView()
    }
    
}

extension SettingsViewController: SettingsViewProtocol {
    
    func updateNotificationContainer(with data: SettingsNotificationContainerDataModel) {
        notificationContainer.sourceItem = data
    }
    
}

extension SettingsViewController: SettingsNotificationContainerDelegate {
    
    func didChangeSwitchValue(_ value: Bool) {
        presenter.didChangeSwitchValue(value)
    }
    
    func didTapSaveButton(with date: Date) {
        presenter.didTapSaveButton(with: date)
    }
    
}
