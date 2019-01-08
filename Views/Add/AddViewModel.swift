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

class AddViewModel: NSObject {
    
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
    
    func save(original: String, translate: String) {
        var translates: [Translate] = []
        
        if let word = word {
            translates = word.translates
        }
        
        WordDataManager.instance.createWord(
            original: original,
            translate: translate,
            translates: translates
        )
    }
    
    func translate(text: String, language: String = "en") {
        let str = text.lowercased()
        let words = offlineDictionary.query(text: str)
        
        didFinishTranslate(words)
        for word in words {
            if word.original == str {
                return
            }
        }
        
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
