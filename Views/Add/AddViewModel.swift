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
    func addTranslate(_ word: Word)
    func showLoader()
    func hideLoader()
}

class AddViewModel: NSObject, ServiceProvider {
    
    var word: Word?
    let onlineDictionary = OnlineDictionary()
    let offlineDictionary = OfflineDictionary()
    var delegate: AddViewModelDelegate!
    var timer: Timer?
    var isLoadingContinue = false

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
    
    func translate(text: String, language: String = Language.en) {
        let str = text.lowercased()
        let words = offlineDictionary.query(text: str)
        
        didFinishTranslate(words)
        for word in words {
            if word.original == str {
                return
            }
        }
        let language = detectLanguage(text: str)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(translateOnline), userInfo: ["text": str, "language": language], repeats: false)
    }
    
    @objc
    func translateOnline(timer: Timer) {
        let userInfo = timer.userInfo as! Dictionary<String, AnyObject>
        let text = userInfo["text"] as! String
        let language = userInfo["language"] as! String
        
        startLoading()
        onlineDictionary.getTk(text, language: language)
    }
    
    func didFinishTranslate(_ words: [Word]) {
        delegate.updateTableView(words)
    }
    
    func cleanData() {
        word = nil
        stopLoading()
    }
    
    func startLoading() {
        delegate.showLoader()
        
        isLoadingContinue = true
    }
    
    func stopLoading() {
        delegate.hideLoader()
        
        if let timer = timer {
            timer.invalidate()
        }
        
        isLoadingContinue = false
    }

}

extension AddViewModel: OnlineDictionaryDelegate {
    
    func didFinishTranslate(_ word: Word?) {
        if isLoadingContinue {
            cleanData()
            if let word = word {
                delegate.addTranslate(word)
            }
        }
    }
    
}