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
    
    @objc func finishCurrentStep() {
        view.hideViews()
    }
    
}

extension SpellingPresenter: SpellingPresenterProtocol {
    
    var currentItem: SpellingViewDataModel {
        get {
            let item = interactor.currentSpellingItem
            let countText = "\(interactor.currentIndex + 1) из \(interactor.numberOfItems)"
            let model = SpellingViewDataModel(header: item.wordData.translate!, count: countText)
            return model
        }
    }
    
    func configureView() {
        interactor.update()
    }
    
    func didTapBackButton() {
        router.back()
    }
    
    func textFieldDidChange(with text: String) {
        interactor.didChange(text: text)
    }
    
    func getHeader() -> String {
        let item = interactor.currentSpellingItem
        return item.wordData.translate!
    }
    
    func getAnswer() -> String {
        interactor.setMistake()
        let item = interactor.currentSpellingItem
        return item.wordData.original!
    }
    
    func didFinishHideViews() {
        interactor.loadNextStep()
    }
    
    func updateViewWithRightAnswer() {
        view.updateWithRightAnswer()
        
        var delay = 0.5
        let original = interactor.currentSpellingItem.wordData.original!
        if original.count > 10 {
            delay = Double(original.count) / 20.0
        }
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(finishCurrentStep), userInfo: nil, repeats: false)
    }
    
    func updateView() {
        view.sourceItem = currentItem
    }
    
    func finish(with mistakes: Int) {
        view.hideKeyboard()
        router.presentResultView(with: mistakes)
    }
    
    func resultViewDidTapNext() {
        router.back()
    }
    
    func resultViewDidTapRepeat() {
        interactor.update()
    }
    
}
