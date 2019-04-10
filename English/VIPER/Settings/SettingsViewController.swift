//
//  SettingsViewController.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var presenter: SettingsPresenterProtocol!
    var configurator: SettingsConfiguratorProtocol = SettingsConfigurator()
    
    let scrollView = ScrollView()
    
    let scrollContainer = UIView()
    
    let headerLabel = UILabel(
        text: "Настройки",
        font: UIFont.book(36)
    )
    
    let notificationContainer = SettingsNotificationContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupViews()
        presenter.configureView()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        notificationContainer.delegate = self
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainer)
        scrollContainer.addSubview(headerLabel)
        scrollContainer.addSubview(notificationContainer)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: scrollView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollView)
        
        view.addConstraintsWithFormat(format: "H:|[v0(\(Screen.width))]|", views: scrollContainer)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: scrollContainer)
        
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: headerLabel)
        view.addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: notificationContainer)
        view.addConstraintsWithFormat(format: "V:|-\(Screen.safeTop + 40)-[v0]-30-[v1]|", views: headerLabel, notificationContainer)
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
