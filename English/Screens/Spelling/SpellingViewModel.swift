//
//  SpellingViewModel.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SpellingItem: Equatable {
    
    var word: WordData
    var sortIndex: Int
    var mistakes: Int
    
    static func == (lhs: SpellingItem, rhs: SpellingItem) -> Bool {
        return lhs.word == rhs.word
    }
    
    init(word: WordData) {
        self.word = word
        self.sortIndex = 0
        self.mistakes = 0
    }
}

class SpellingViewModel: NSObject, ServiceProvider {
    
    var sourceItem: Any? {
        didSet {
            guard let words = sourceItem as? [WordData] else { return }
            self.words = words
            loadData()
        }
    }
    
    var words: [WordData] = []
    var randomList: [SpellingItem]!
    var currentIndex: Int = -1
    var mistakes: Int = 0
    var isMadeMistake: Bool = false
    
    func loadData() {
        currentIndex = -1
        mistakes = 0
        isMadeMistake = false
        
        randomList = getSpellingItemList(words)
        generateRandomList()
    }
    
    func getSpellingItemList(_ words: [WordData]) -> [SpellingItem] {
        var spellingItemList: [SpellingItem] = []
        for word in words {
            let spellingItem = SpellingItem(word: word)
            spellingItemList.append(spellingItem)
        }
        return spellingItemList
    }
    
    func generateRandomList() {
        for item in randomList {
            item.sortIndex = Int(arc4random_uniform(1000))
        }
        randomList.sort { $0.sortIndex < $1.sortIndex }
    }
    
    func getNextSpellingItem() -> SpellingItem? {
        isMadeMistake = false
        if currentIndex + 1 < randomList.count {
            currentIndex += 1
            return randomList[currentIndex]
        } else {
            return nil
        }
    }
    
    func compareWords(original: String) -> Bool {
        if original.lowercased() == randomList[currentIndex].word.original!.lowercased() {
            return true
        } else {
            errorAnswer()
            return false
        }
    }
    
    func tmpCompareWords(original: String) -> Bool {
        if original.lowercased() == randomList[currentIndex].word.original!.lowercased() {
            return true
        } else {
            return false
        }
    }
    
    func errorAnswer() {
        if !isMadeMistake {
            mistakes += 1
            if currentIndex + 3 < randomList.count {
                randomList.insert(randomList[currentIndex], at: currentIndex + 3)
            } else {
                randomList.append(randomList[currentIndex])
            }
            isMadeMistake = true
            randomList[currentIndex].mistakes += 1
        }
    }
    
    func setRepeats() {
        let spellingItemList = removeDuplicates()
        wordDataService.setRepeats(spellingItemList)
    }
    
    func removeDuplicates() -> [SpellingItem] {
        var spellingItemList: [SpellingItem] = []
        for item in randomList {
            if spellingItemList.contains(item) == false {
                spellingItemList.append(item)
            }
        }
        return spellingItemList
    }
    
    func getOriginal() -> String {
        return randomList[currentIndex].word.original!
    }
    
    func getTranslate() -> String {
        return randomList[currentIndex].word.translate!
    }
    
    func getCountLabelText() -> String {
        return "\(currentIndex + 1) из \(randomList.count)"
    }

}
