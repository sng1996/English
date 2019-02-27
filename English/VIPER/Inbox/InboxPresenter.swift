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
            
            if !interactor.isShowStartHint {
                MainViewController.tabBarView.showStartHint()
            }
        } else {
            view.showEmptyView()
            view.hideStartButton()
        }
        view.update()
        
        if !interactor.isShowNotificationHint {
            view.showRememberHint()
        }
    }
    
    func isShowCountHint() -> Bool {
        return interactor.isShowCountHint
    }
    
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath) {
        let word = interactor.itemAt(indexPath.row)
        router.presentTranslateViewController(with: word)
    }
    
    func collectionViewNumberOfItems() -> Int {
        return interactor.numberOfItems
    }
    
    func collectionViewDataForItemAt(_ indexPath: IndexPath) -> WordCellDataModel {
        let word = interactor.itemAt(indexPath.row)
        let isActive = indexPath.row < 10
        return WordCellDataModel(word, isActive: isActive)
    }
    
    func scrollViewDidScroll(contentOffset: CGFloat) {
        router.addViewDidDragging(contentOffset)
    }
    
    func scrollViewDidEndDragging(contentOffset: CGFloat) {
        router.addViewDidEndDragging(contentOffset)
    }
    
    func scrollViewWillBeginDragging() {
        router.presentAddViewController()
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
    
    func rememberHintDidTapAcceptButton() {
        interactor.requestAccessForNotifications()
    }
    
}
