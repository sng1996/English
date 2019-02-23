//
//  ChoosingPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingPresenter {
    
    weak var view: ChoosingViewProtocol!
    var interactor: ChoosingInteractorProtocol!
    var router: ChoosingRouterProtocol!
    
    required init(view: ChoosingViewProtocol) {
        self.view = view
    }
    
}

extension ChoosingPresenter: ChoosingPresenterProtocol {
    
}
