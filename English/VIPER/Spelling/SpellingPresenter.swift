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
    
    func configureView() {
        interactor.update()
    }
    
    func didTapBackButton() {
        router.back()
    }
    
    func didTapShowAnswer() {
        let text = interactor.currentSpellingItem
        view.showAnswer(text)
    }
    
    func textFieldDidChange(with text: String) {
        interactor.didChange(text: text)
    }
    
    func update(isRight: Bool, rightText: String = "") {
        view.update(isRight: isRight, rightText: rightText)
    }
    
    func updateView() {
        let currentItem = interactor.currentSpellingItem
        view.sourceItem = SpellingViewControllerDataModel(currentItem)
    }
    
    func finish(with: mistakesCount) {
        router.finish()
    }
    
}
