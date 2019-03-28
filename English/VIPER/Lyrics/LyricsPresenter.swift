//
//  LyricsPresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class LyricsPresenter {
    
    weak var view: LyricsViewProtocol!
    var interactor: LyricsInteractorProtocol!
    var router: LyricsRouterProtocol!
    
    required init(view: LyricsViewProtocol) {
        self.view = view
    }
    
}

extension LyricsPresenter: LyricsPresenterProtocol {
    
    func configureView() {
        interactor.update()
    }
    
    func updateView() {
        let song = interactor.getSong()
        view.sourceItem = LyricsViewModelData(song)
    }
    
}
