//
//  RepeatsPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsPresenter {
    
    weak var view: RepeatsViewProtocol!
    var interactor: RepeatsInteractorProtocol!
    var router: RepeatsRouterProtocol!
    
    required init(view: RepeatsViewProtocol) {
        self.view = view
    }
    
}

extension RepeatsPresenter: RepeatsPresenterProtocol {
    
}
