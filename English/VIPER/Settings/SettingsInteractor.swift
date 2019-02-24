//
//  SettingsInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SettingsInteractor {
    
    weak var presenter: SettingsPresenterProtocol!
    
    var notificationService = NotificationService()
    
    required init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension SettingsInteractor: SettingsInteractorProtocol {
    
    func getIsOn() -> Bool {
        return notificationService.isOn
    }
    
    func getTime() -> String {
        return notificationService.time
    }
    
    func set(isOn: Bool) {
        notificationService.isOn = isOn
        presenter.updateNotificationContainer()
    }
    
    func set(time: String) {
        notificationService.time = time
        presenter.updateNotificationContainer()
    }
    
}
