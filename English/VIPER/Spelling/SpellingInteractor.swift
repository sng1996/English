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
    var currentIndex: Int = -1
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
            print("qpojfpow", spellingItems.count)
            wordDataService.setRepeats(spellingItemList)
            isFirstTime = false
        }
        presenter.finish(with: mistakesCount)
    }
    
}

extension SpellingInteractor: SpellingInteractorProtocol {
    
    var currentSpellingItem: SpellingItem {
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
        currentIndex = -1
        mistakesCount = 0
        isMadeMistake = false
        loadNextStep()
    }
    
    func loadNextStep() {
        isMadeMistake = false
        if currentIndex + 1 < spellingItems.count {
            currentIndex += 1
            presenter.updateView()
        } else {
            finish()
        }
    }
    
    func didChange(text: String) {
        if text.lowercased() == spellingItems[currentIndex].wordData.original!.lowercased() {
            speechService.play(text.lowercased())
            presenter.updateViewWithRightAnswer()
        }
    }
    
    func setMistake() {
        if !isMadeMistake {
            mistakesCount += 1
            if currentIndex + 3 < spellingItems.count {
                spellingItems.insert(spellingItems[currentIndex], at: currentIndex + 3)
            } else {
                spellingItems.append(spellingItems[currentIndex])
            }
            isMadeMistake = true
            spellingItems[currentIndex].isMadeMistake = true
        }
    }
    
}
