//
//  SettingsPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SettingsPresenter {
    
    weak var viewController: SettingsViewProtocol!
    var interactor: SettingsInteractorProtocol!
    var router: SettingsRouterProtocol!
    
    required init(viewController: SettingsViewProtocol) {
        self.viewController = viewController
    }
    
}

extension SettingsPresenter: SettingsPresenterProtocol {
    
    func configureView() {
        updateNotificationContainer()
    }
    
    func updateNotificationContainer() {
        let isOn = interactor.getIsOn()
        let time = interactor.getTime()
        let model = SettingsNotificationContainerDataModel(isOn: isOn, time: time)
        viewController.updateNotificationContainer(with: model)
    }
    
    func didChangeSwitchValue(_ value: Bool) {
        interactor.set(isOn: value)
    }
    
    func didTapSaveButton(with date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let text = formatter.string(from: date)
        interactor.set(time: text)
    }
    
}

