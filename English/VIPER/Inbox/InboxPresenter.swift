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
        interactor.update()
    }
    
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath) {
        let word = interactor.itemAt(indexPath.row)
        let model = TranslateViewDataModel(word)
        view.openTranslateView(with: model)
    }
    
    func collectionViewNumberOfItems() -> Int {
        return interactor.numberOfItems()
    }
    
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel {
        let word = interactor.itemAt(indexPath.row)
        return WordCellDataModel(word)
    }
    
    func updateView() {
        let numberOfItems = interactor.numberOfItems()
        if numberOfItems > 0 {
            view.hideEmptyView()
            view.hideStartButton()
        } else {
            view.showEmptyView()
            view.showStartButton()
        }
        view.update()
    }
    
}
