//
//  ResultPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ResultPresenter {
    
    weak var view: ResultViewProtocol!
    var interactor: ResultInteractorProtocol!
    var router: ResultRouterProtocol!
    
    required init(view: ResultViewProtocol) {
        self.view = view
    }
    
}

extension ResultPresenter: ResultPresenterProtocol {
    
}
