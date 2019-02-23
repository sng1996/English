//
//  NewThemeInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class NewThemeInteractor {
    
    weak var presenter: NewThemePresenterProtocol!
    
    required init(presenter: NewThemePresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension NewThemeInteractor: NewThemeInteractorProtocol {
    
}
