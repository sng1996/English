//
//  TranslatePresenter.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslatePresenter {

    weak var view: TranslateViewProtocol!
    var interactor: TranslateInteractorProtocol!
    var router: TranslateRouterProtocol!
    
    required init(view: TranslateViewProtocol) {
        self.view = view
    }

}

extension TranslatePresenter: TranslatePresenterProtocol {
    
    func configureView() {
        let word = interactor.word
        view.sourceItem = TranslateViewDataModel(word)
    }
    
    func didTapDeleteButton() {
        interactor.delete()
        view.close()
    }
    
    func didTapSoundButton() {
        interactor.play()
    }
    
}
