//
//  SettingsPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SettingsPresenter {
    
    weak var view: SettingsViewProtocol!
    var interactor: SettingsInteractorProtocol!
    var router: SettingsRouterProtocol!
    
    required init(view: SettingsViewProtocol) {
        self.view = view
    }
    
}

extension SettingsPresenter: SettingsPresenterProtocol {
    
}

