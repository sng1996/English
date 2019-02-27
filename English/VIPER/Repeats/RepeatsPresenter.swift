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
    
    func configureView() {
        if interactor.todayWordsCount > 0 {
            view.hideEmptyView()
            view.hideStartButton()
        } else {
            view.showEmptyView()
            view.showStartButton()
        }
        view.update()
    }
    
    func tableViewDidSelectItemAt(_ indexPath: IndexPath) {
        let word = interactor.itemAt(indexPath.row)
        router.presentTranslateViewController(with: word)
    }
    
    func tableViewNumberOfItems() -> Int {
        return interactor.numberOfItems()
    }
    
    func tableViewDataForItemAt(_ indexPath: IndexPath) -> RepeatsCellDataModel {
        let word = interactor.itemAt(indexPath.row)
        let isActive = indexPath.row < interactor.todayWordsCount
        return RepeatsCellDataModel(word, isActive: isActive)
    }
    
    func didTapStartButton() {
        let words = interactor.firstWords
        router.presentStartViewController(with: words)
    }
    
    func didSuccessfullyFinishStartView(with data: [WordData]) {
        router.presentChoosingViewController(with: data)
    }
    
    func didSuccessfullyFinishChoosingView(with data: [WordData]) {
        router.presentSpellingViewController(with: data)
    }
    
}
