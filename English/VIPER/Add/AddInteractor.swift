//
//  AddInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddInteractor: ServiceProvider {

    weak var presenter: AddPresenterProtocol!
    
    let onlineDictionary = OnlineDictionary()
    let offlineDictionary = OfflineDictionary()
    
    var word: Word?
    var words: [Word] = []
    
    required init(presenter: AddPresenterProtocol) {
        self.presenter = presenter
        onlineDictionary.delegate = self
    }
    
    func detectLanguage(text: String) -> String {
        if let c = text.lowercased().first {
            return c.detectLanguage()
        }
        return Language.en
    }

}

extension AddInteractor: AddInteractorProtocol {
    
    var numberOfItems: Int {
        get {
            return words.count
        }
    }
    
    func textDidChange(with text: String) {
        words = offlineDictionary.query(text: text.lowercased())
    }
    
    func didFinishFirstStep(with text: String) {
        if words.isEmpty || words[0].original.lowercased() != text.lowercased() {
            let language = detectLanguage(text: text)
            presenter.startLoading()
            onlineDictionary.getTk(text, language: language)
        } else {
            word = words[0]
            presenter.startSecondStep()
        }
    }
    
    func save(header: String, footer: String) {
        var translates: [Translate] = []
        let language = detectLanguage(text: header)
        
        if let word = word {
            translates = word.translates
        }
        
        var original = header
        var translate = footer
        
        if language == Language.ru {
            original = footer
            translate = header
        }
        
        wordDataService.createWord(
            original: original,
            translate: translate,
            translates: translates
        )
    }
    
    func didSelectItemAt(_ index: Int) {
        word = words[index]
        presenter.startSecondStep()
    }
    
    func itemAt(_ index: Int) -> Word {
        return words[index]
    }
    
}

extension AddInteractor: OnlineDictionaryDelegate {
    
    func didFinishTranslate(_ word: Word) {
        self.word = word
        presenter.startSecondStep()
    }
    
}
