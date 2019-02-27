////
////  ChoosingViewModel.swift
////  English
////
////  Created by Сергей Гаврилко on 27/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//struct ChooseItem {
//    
//    var originalWord: WordData!
//    var supportWords: [String] = []
//    var trueIndex = 0
//    
//    mutating func generateWords(original: WordData, supportWords: [String]) {
//        self.originalWord = original
//        self.supportWords = supportWords
//        
//        let randomIndex = Int(arc4random_uniform(4))
//        if randomIndex > 2 {
//            self.supportWords.append(self.originalWord.translate!)
//        } else {
//            self.supportWords.insert(self.originalWord.translate!, at: randomIndex)
//        }
//        trueIndex = randomIndex
//    }
//    
//}
//
//class WordItem {
//    var word: WordData
//    var sortIndex: Int = 0
//    
//    init(word: WordData) {
//        self.word = word
//    }
//}
//
//class ChoosingViewModel: NSObject {
//    
//    var sourceItem: Any? {
//        didSet {
//            guard let words = sourceItem as? [WordData] else { return }
//            self.words = words
//            loadData()
//        }
//    }
//
//    var randomNumbers: [Int]!
//    var supportWords: [String]!
//    var supportDictionary = SupportDictionary()
//    
//    var words: [WordData]!
//    var randomList: [WordItem]!
//    var chooseItems: [ChooseItem]!
//    var currentIndex: Int!
//    var mistakesCount: Int!
//    
//    func loadData() {
//        randomNumbers = []
//        supportWords = []
//        randomList = []
//        chooseItems = []
//        currentIndex = -1
//        mistakesCount = 0
//        
//        randomList = generateRandomList()
//        fillRandomNumbers()
//        fillSupportWords()
//        fillChooseItems()
//    }
//    
//    func getWordItemList(_ words: [WordData]) -> [WordItem] {
//        var wordItemList: [WordItem] = []
//        for word in words {
//            let wordItem = WordItem(word: word)
//            wordItemList.append(wordItem)
//        }
//        return wordItemList
//    }
//    
//    func generateRandomList() -> [WordItem] {
//        var randomWords = getWordItemList(words)
//        for item in randomWords {
//            item.sortIndex = Int(arc4random_uniform(1000))
//        }
//        randomWords.sort { $0.sortIndex < $1.sortIndex }
//        return randomWords
//    }
//    
//    func getNextChooseItem() -> ChooseItem? {
//        if currentIndex + 1 < chooseItems.count {
//            currentIndex += 1
//            return chooseItems[currentIndex]
//        } else {
//            return nil
//        }
//    }
//    
//    func getChooseItem() -> ChooseItem {
//        return chooseItems[currentIndex]
//    }
//    
//    func compareWords(index: Int) -> Bool {
//        if chooseItems[currentIndex].supportWords[index] == chooseItems[currentIndex].originalWord.translate {
//            return true
//        } else {
//            if currentIndex + 3 < chooseItems.count {
//                chooseItems.insert(chooseItems[currentIndex], at: currentIndex + 3)
//            } else {
//                chooseItems.append(chooseItems[currentIndex])
//            }
//            mistakesCount += 1
//            return false
//        }
//    }
//    
//    func findTrueIndex() -> Int {
//        return chooseItems[currentIndex].trueIndex
//    }
//    
//    func getCountLabelText() -> String {
//        return "\(currentIndex + 1) из \(chooseItems.count)"
//    }
//    
//    func fillRandomNumbers() {
//        for _ in 0..<(words.count * 3) {
//            randomNumbers.append(findNumber())
//        }
//    }
//    
//    func findNumber() -> Int {
//        let number = Int(arc4random_uniform(3094)) + 1
//        var isFind = false
//        for num in randomNumbers {
//            if num == number {
//                isFind = true
//                break
//            }
//        }
//        if isFind {
//            return findNumber()
//        } else {
//            return number
//        }
//    }
//    
//    func fillSupportWords() {
//        for number in randomNumbers {
//            supportWords.append(findWord(number))
//        }
//    }
//    
//    func findWord(_ number: Int) -> String {
//        let word = supportDictionary.query(number)
//        var isFind = false
//        for w in words {
//            if word == w.translate {
//                isFind = true
//                break
//            }
//        }
//        if isFind {
//            return findWord(findNumber())
//        } else {
//            return word
//        }
//    }
//    
//    func fillChooseItems() {
//        for item in randomList {
//            let tmpSupportWords = getThreeSupportWords(for: item.word.original!)
//            var chooseItem = ChooseItem()
//            chooseItem.generateWords(original: item.word, supportWords: tmpSupportWords)
//            chooseItems.append(chooseItem)
//        }
//    }
//    
//    func getThreeSupportWords(for word: String) -> [String] {
//        var words: [String] = []
//        if randomList.count > 5 {
//            words = getSupportWordsFromRandomList(for: word)
//        } else {
//            for _ in 0...2 {
//                words.append(supportWords.last!)
//                supportWords.removeLast()
//            }
//        }
//        return words
//    }
//    
//    func getSupportWordsFromRandomList(for word: String) -> [String] {
//        var words: [String] = []
//        var indexes: [Int] = []
//        for i in randomList.indices {
//            if randomList[i].word.original == word {
//                indexes.append(i)
//                break
//            }
//        }
//        
//        for _ in 0..<3 {
//            let index = getRandomIndex(indexes: indexes)
//            words.append(randomList[index].word.translate!)
//            indexes.append(index)
//        }
//        return words
//    }
//    
//    func getRandomIndex(indexes: [Int]) -> Int {
//        let index = Int(arc4random_uniform(UInt32(randomList.count - 1)))
//        for i in indexes {
//            if i == index {
//                return getRandomIndex(indexes: indexes)
//            }
//        }
//        return index
//    }
//
//}
