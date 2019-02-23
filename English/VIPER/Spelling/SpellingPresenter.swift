//
//  SpellingPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingPresenter {
    
    weak var view: SpellingViewProtocol!
    var interactor: SpellingInteractorProtocol!
    var router: SpellingRouterProtocol!
    
    required init(view: SpellingViewProtocol) {
        self.view = view
    }
    
}

extension SpellingPresenter: SpellingPresenterProtocol {
    
}
