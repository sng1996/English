//
//  InboxPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxPresenter {

    weak var view: InboxViewProtocol!
    var interactor: InboxInteractorProtocol!
    var router: InboxRouterProtocol!
    
    required init(view: InboxViewProtocol) {
        self.view = view
    }

}

extension InboxPresenter: InboxPresenterProtocol {
    
    func configureView() {
        let numberOfItems = interactor.numberOfItems
        if numberOfItems > 0 {
            view.hideEmptyView()
            view.showStartButton()
        } else {
            view.showEmptyView()
            view.hideStartButton()
        }
        view.update()
    }
    
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath) {
        let word = interactor.itemAt(indexPath.row)
        view.openTranslateView(with: word)
    }
    
    func collectionViewNumberOfItems() -> Int {
        return interactor.numberOfItems
    }
    
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel {
        let word = interactor.itemAt(indexPath.row)
        let isActive = indexPath.row < 10
        return WordCellDataModel(word, isActive: isActive)
    }
    
    func didTapStartButton() {
        let words = interactor.firstWords
        router.presentStartViewController(with: words)
    }
    
}
