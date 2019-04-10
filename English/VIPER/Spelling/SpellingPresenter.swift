//
//  SpellingPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingPresenter {
    
    weak var viewController: SpellingViewProtocol!
    var interactor: SpellingInteractorProtocol!
    var router: SpellingRouterProtocol!
    
    required init(viewController: SpellingViewProtocol) {
        self.viewController = viewController
    }
    
}

extension SpellingPresenter: SpellingPresenterProtocol {
    
    func configureView() {
        interactor.update()
    }
    
    func collectionViewNumberOfItems() -> Int {
        return interactor.numberOfItems
    }
    
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> SpellingCellDataModel {
        let word = interactor.itemAt(indexPath.row)
        return SpellingCellDataModel(word)
    }
    
    func didTapBackButton() {
        router.back()
    }
    
    func didTapCheckButton(with text: String) {
        viewController.updateWithRed()
        interactor.setMistake()
    }
    
    func textFieldDidChange(with text: String) {
        interactor.didChange(text: text)
    }

    func updateViewWithGreen() {
        viewController.updateWithGreen()

        var delay = 0.5
        let original = interactor.currentItem.wordData.original ?? ""
        if original.count > 10 {
            delay = Double(original.count) / 20.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.interactor.next()
        }
    }
    
    func insertItemAt(_ index: Int) {
        viewController.insert(at: [IndexPath(row: index, section: 0)])
    }
    
    func scrollToNext(_ index: Int) {
        viewController.scrollToNext(IndexPath(row: index, section: 0))
    }
    
    func finish(with mistakes: Int) {
        let model = ResultViewDataModel(ResultMode.spelling, mistakes: mistakes)
        viewController.openResultView(with: model)
    }
    
    func getCountLabelText() -> String {
        return "\(interactor.currentIndex + 1) из \(interactor.numberOfItems)"
    }
    
    func getAnswer() -> String {
        interactor.setMistake()
        return interactor.currentItem.wordData.original ?? ""
    }
    
    func resultViewDidTapNext() {
        router.back()
    }
    
    func resultViewDidTapRepeat() {
        interactor.update()
        viewController.update()
    }
}
