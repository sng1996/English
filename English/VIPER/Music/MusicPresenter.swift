//
//  MusicPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 27/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class MusicPresenter {
    
    weak var view: MusicViewProtocol!
    var interactor: MusicInteractorProtocol!
    var router: MusicRouterProtocol!
    
    required init(view: MusicViewProtocol) {
        self.view = view
    }
    
}

extension MusicPresenter: MusicPresenterProtocol {
    
    func tableViewDidSelectRowAt(_ indexPath: IndexPath) {
        let song = interactor.itemAt(indexPath.row)
        router.presentLyricsViewController(with: song)
    }
    
    func tableViewNumberOfRows() -> Int {
        return interactor.numberOfItems
    }
    
    func tableViewDataForRowAt(_ indexPath: IndexPath) -> MusicCellDataModel {
        let song = interactor.itemAt(indexPath.row)
        return MusicCellDataModel(song)
    }
    
    func didTapSearchButton(with text: String) {
        interactor.search(text)
    }
    
    func updateView() {
        view.update()
    }
    
}
