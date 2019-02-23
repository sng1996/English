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
    
    required init(presenter: SettingsPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension SettingsInteractor: SettingsInteractorProtocol {
    
}
