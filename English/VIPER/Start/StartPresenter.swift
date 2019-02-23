//
//  StartPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class StartPresenter {
    
    weak var view: StartViewProtocol!
    var interactor: StartInteractorProtocol!
    var router: StartRouterProtocol!
    
    required init(view: StartViewProtocol) {
        self.view = view
    }
    
}

extension StartPresenter: StartPresenterProtocol {
    
}

