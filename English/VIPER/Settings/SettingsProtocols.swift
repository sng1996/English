//
//  SettingsProtocols.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol SettingsViewProtocol: class {
    func updateNotificationContainer(with data: SettingsNotificationContainerDataModel)
}

protocol SettingsPresenterProtocol: class {
    func configureView()
    func updateNotificationContainer()
    func didChangeSwitchValue(_ value: Bool)
    func didTapSaveButton(with date: Date)
}

protocol SettingsInteractorProtocol: class {
    func getIsOn() -> Bool
    func getTime() -> String
    func set(isOn: Bool)
    func set(time: String)
}

protocol SettingsRouterProtocol: class {
    
}

protocol SettingsConfiguratorProtocol: class {
    func configure(with viewController: SettingsViewController)
}
