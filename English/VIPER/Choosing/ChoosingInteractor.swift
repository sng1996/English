//
//  ChoosingInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ChoosingInteractor {
    
    weak var presenter: ChoosingPresenterProtocol!
    
    var speechService = SpeechService()
    
    var words: [WordData] = []
    var choosingItems: [ChoosingItem] = []
    var currentIndex: Int = -1
    var mistakesCount: Int = 0
    
    required init(presenter: ChoosingPresenterProtocol, data: [WordData]) {
        self.presenter = presenter
        words = data
    }
    
}

extension ChoosingInteractor: ChoosingInteractorProtocol {
    
    var currentItem: ChoosingItem {
        get {
            return choosingItems[currentIndex]
        }
    }
    
    var numberOfItems: Int {
        get {
            return choosingItems.count
        }
    }
    
    func update() {
        let choosingService = ChoosingService()
        choosingItems = choosingService.data(for: words)
        currentIndex = -1
        mistakesCount = 0
        loadNextStep()
    }
    
    func loadNextStep() {
        if currentIndex + 1 < choosingItems.count {
            currentIndex += 1
            presenter.updateView()
            speechService.play(currentItem.wordData.original!)
        } else {
            presenter.finish(with: mistakesCount)
        }
    }
    
    func didSelectItemAt(_ index: Int) {
        if choosingItems[currentIndex].rightAnswerIndex == index {
            presenter.updateView(isRight: true, index: index)
        } else {
            presenter.updateView(isRight: false, index: index)
            mistakesCount += 1
            if currentIndex + 3 < choosingItems.count {
                choosingItems.insert(choosingItems[currentIndex], at: currentIndex + 3)
            } else {
                choosingItems.append(choosingItems[currentIndex])
            }
        }
    }
    
    func itemAt(_ index: Int) -> String {
        return choosingItems[currentIndex].supportWords[index]
    }
    
}
