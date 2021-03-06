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
            view.showStartButton()
        } else {
            view.hideStartButton()
        }
        if interactor.numberOfItems() > 0 {
            view.hideEmptyView()
        } else {
            view.showEmptyView()
        }
        view.update()
    }
    
    func tableViewDidSelectItemAt(_ indexPath: IndexPath) {
        let word = interactor.itemAt(indexPath.row)
        view.openTranslateView(with: word)
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
    
    func getBadgeValue() -> Int {
        return interactor.todayWordsCount
    }
    
}
