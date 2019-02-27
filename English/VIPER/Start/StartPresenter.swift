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
    
    func configureView() {
        view.update()
    }
    
    func didTapBackButton() {
        router.back()
    }
    
    func didTapPassButton() {
        let words = interactor.words
        router.forward(with: words)
    }
    
    func didTapStartButton() {
        let words = interactor.words
        router.forward(with: words)
    }
    
    func numberOfItems() -> Int {
        return interactor.numberOfItems()
    }
    
    func itemAt(_ index: Int) -> CardViewDataModel {
        let word = interactor.itemAt(index)
        let model = CardViewDataModel(word)
        return model
    }
    
}

