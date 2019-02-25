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
    
    var words: [WordData] = []
    var spellingItems: [SpellingItem] = []
    var currentIndex: Int = -1
    var mistakesCount: Int = 0
    var isMadeMistake: Bool = false
    
    required init(presenter: SpellingPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension SpellingInteractor: SpellingInteractorProtocol {
    
    var currentSpellingItem: SpellingItem {
        get {
            return spellingItems[currentIndex]
        }
    }
    
    func update() {
        spellingItems = spellingService.data(for: words)
        currentIndex = -1
        mistakesCount = 0
        isMadeMistake = false
    }
    
    func loadNextStep() {
        isMadeMistake = false
        if currentIndex + 1 < spellingItems.count {
            currentIndex += 1
            presenter.updateView()
        } else {
            presenter.finish(with: mistakesCount)
        }
    }
    
    func didChange(text: String) {
        if text.lowercased() == spellingItems[currentIndex].wordData.original!.lowercased() {
            presenter.update(isRight: true)
        } else {
            didEnterErrorAnswer()
            presenter.update(isRight: false, rightText: spellingItems[currentIndex].wordData.original!.lowercased())
        }
    }
    
    func didEnterErrorAnswer() {
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
    
    func didFinishTask() {
        let spellingItemList = spellingService.removeDuplicates(for: spellingItems)
        wordDataService.setRepeats(spellingItemList)
    }
    
}
