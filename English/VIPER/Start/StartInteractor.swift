//
//  StartInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartInteractor {
    
    weak var presenter: StartPresenterProtocol!
    
    required init(presenter: StartPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension StartInteractor: StartInteractorProtocol {
    
}
