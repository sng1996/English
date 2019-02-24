//
//  ChoosingPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingPresenter {
    
    weak var view: ChoosingViewProtocol!
    var interactor: ChoosingInteractorProtocol!
    var router: ChoosingRouterProtocol!
    
    required init(view: ChoosingViewProtocol) {
        self.view = view
    }
    
}

extension ChoosingPresenter: ChoosingPresenterProtocol {
    
    var currentItem: ChoosingViewControllerDataModel {
        get {
            let item = interactor.currentItem
            let countText = "\(interactor.currentIndex + 1) из \(interactor.numberOfItems)"
            let model = ChoosingViewControllerDataModel(header: item.wordData.original!, count: countText)
            return model
        }
    }
    
    func configureView() {
        interactor.update()
    }
    
    func didTapBackButton() {
        router.back()
    }
    
    func didTapNextButton() {
        interactor.loadNextStep()
    }
    
    func collectionViewDidSelectItemAt(_ indexPath: IndexPath) {
        interactor.didSelectItemAt(indexPath.row)
    }
    
    func collectionViewItemAt(_ indexPath: IndexPath) -> ChoosingCellDataModel {
        let text = interactor.itemAt(indexPath.row)
        let model = ChoosingCellDataModel(text)
        return model
    }
    
    func updateView() {
        view.update()
    }
    
    func updateView(isRight: Bool, index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        view.update(isRight: isRight, indexPath: indexPath)
    }
    
    func finish(with mistakes: Int) {
        router.presentResultView(with: mistakes)
    }
    
}
