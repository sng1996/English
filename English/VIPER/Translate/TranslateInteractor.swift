//
//  TranslateInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateInteractor: ServiceProvider {

    weak var presenter: TranslatePresenterProtocol!
    var word: WordData
    
    let speechService = SpeechService()
    
    required init(presenter: TranslatePresenterProtocol, data: WordData) {
        self.presenter = presenter
        word = data
    }
}

extension TranslateInteractor: TranslateInteractorProtocol {
    
    func delete() {
        wordDataService.delete(word)
    }
    
    func play() {
        speechService.play(word.original!)
    }
    
}
