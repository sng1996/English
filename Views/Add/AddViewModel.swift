//
//  AddViewModel.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol AddViewModelDelegate {
    func updateTableView(_ data: [Word])
    func didChooseWord(_ word: Word?)
    func showLoader()
    func startSave()
}

class AddViewModel: NSObject, ServiceProvider {
    
    var word: Word?
    let onlineDictionary = OnlineDictionary()
    let offlineDictionary = OfflineDictionary()
    var delegate: AddViewModelDelegate!
    var timer: Timer?

    override init() {
        super.init()
        onlineDictionary.delegate = self
    }
    
    func detectLanguage(text: String) -> String {
        if let c = text.lowercased().first {
            return c.detectLanguage()
        }
        return Language.en
    }
    
    func save(original: String, translate: String) {
        var translates: [Translate] = []
        let language = detectLanguage(text: original)
        
        if let word = word {
            translates = word.translates
        }
        
        var header = original
        var footer = translate
        
        if language == Language.ru {
            header = translate
            footer = original
        }
        
        wordDataService.createWord(
            original: header,
            translate: footer,
            translates: translates
        )
    }
    
    func offlineTranslate(_ text: String) {
        let words = offlineDictionary.query(text: text.lowercased())
        delegate.updateTableView(words)
    }
    
    func onlineTranslate(_ text: String) {
        let language = detectLanguage(text: text)
        startLoading()
        onlineDictionary.getTk(text, language: language)
    }
    
    func cleanData() {
        word = nil
    }
    
    func startLoading() {
        delegate.showLoader()
    }
    
    func startSave() {
        delegate.startSave()
    }

}

extension AddViewModel: OnlineDictionaryDelegate {
    
    func didFinishTranslate(_ word: Word?) {
        startSave()
        cleanData()
        delegate.didChooseWord(word)
    }
    
}
