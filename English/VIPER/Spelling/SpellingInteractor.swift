//
//  SpellingInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingInteractor: ServiceProvider {
    
    weak var presenter: SpellingPresenterProtocol!
    
    let spellingService = SpellingService()
    let speechService = SpeechService()
    
    var words: [WordData] = []
    var spellingItems: [SpellingItem] = []
    var currentIndex: Int = 0
    var mistakesCount: Int = 0
    var isMadeMistake: Bool = false
    var isFirstTime: Bool = true
    
    required init(presenter: SpellingPresenterProtocol, data: [WordData]) {
        self.presenter = presenter
        words = data
    }
    
    func finish() {
        if isFirstTime {
            let spellingItemList = spellingService.removeDuplicates(for: spellingItems)
            wordDataService.setRepeats(spellingItemList)
            isFirstTime = false
        }
        presenter.finish(with: mistakesCount)
    }
    
}

extension SpellingInteractor: SpellingInteractorProtocol {
    
    var currentItem: SpellingItem {
        get {
            return spellingItems[currentIndex]
        }
    }
    
    var numberOfItems: Int {
        get {
            return spellingItems.count
        }
    }
    
    func update() {
        spellingItems = spellingService.data(for: words)
        currentIndex = 0
        mistakesCount = 0
        isMadeMistake = false
    }
    
    func itemAt(_ index: Int) -> SpellingItem {
        return spellingItems[index]
    }
    
    func next() {
        isMadeMistake = false
        if currentIndex + 1 < spellingItems.count {
            currentIndex += 1
            presenter.scrollToNext(currentIndex)
        } else {
            finish()
        }
    }
    
    func didChange(text: String) {
        if text.lowercased() == spellingItems[currentIndex].wordData.original!.lowercased() {
            speechService.play(text.lowercased())
            presenter.updateViewWithGreen()
        }
    }
    
    func setMistake() {
        if !isMadeMistake {
            mistakesCount += 1
            if currentIndex + 3 < spellingItems.count {
                spellingItems.insert(spellingItems[currentIndex], at: currentIndex + 3)
                presenter.insertItemAt(currentIndex + 3)
            } else {
                spellingItems.append(spellingItems[currentIndex])
                presenter.insertItemAt(spellingItems.count - 1)
            }
            isMadeMistake = true
            spellingItems[currentIndex].isMadeMistake = true
        }
    }
    
}
