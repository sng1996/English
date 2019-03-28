//
//  ChoosingService.swift
//  English
//
//  Created by Сергей Гаврилко on 24/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

struct ChoosingItem {
    
    var wordData: WordData!
    var supportWords: [String] = []
    var rightAnswerIndex = 0
    var sortIndex = Int(arc4random_uniform(1000))
    
    init(_ data: WordData, supportWords: [String]) {
        wordData = data
        self.supportWords = supportWords
        
        rightAnswerIndex = Int(arc4random_uniform(4))
        if rightAnswerIndex > 2 {
            self.supportWords.append(wordData.translate!)
        } else {
            self.supportWords.insert(wordData.translate!, at: rightAnswerIndex)
        }
    }
    
}

class ChoosingService {

    func data(for array: [WordData]) -> [ChoosingItem] {
        if array.count > 4 {
            return choosingItems(for: array)
        } else {
            return choosingItemsUsingDictionary(for: array)
        }
    }
    
    func choosingItems(for array: [WordData]) -> [ChoosingItem] {
        var choosingItems: [ChoosingItem] = []
        for word in array {
            let supportArray = supportWords(of: word, using: array)
            let item = ChoosingItem(word, supportWords: supportArray)
            choosingItems.append(item)
        }
        choosingItems.sort { $0.sortIndex < $1.sortIndex }
        return choosingItems
    }
    
    func choosingItemsUsingDictionary(for array: [WordData]) -> [ChoosingItem] {
        let supportDictionary = SupportDictionary()
        var supportDictionaryArray = supportWords(from: supportDictionary)
        var choosingItems: [ChoosingItem] = []
        
        for word in array {
            let supportArray = Array(supportDictionaryArray.suffix(3))
            supportDictionaryArray.removeLast(3)
            let choosingItem = ChoosingItem(word, supportWords: supportArray)
            choosingItems.append(choosingItem)
        }
        choosingItems.sort { $0.sortIndex < $1.sortIndex }
        return choosingItems
    }
    
    func supportWords(from dictionary: SupportDictionary) -> [String] {
        var words: [String] = []
        let randomNumbersArray = randomNumbers()
        for number in randomNumbersArray {
            let word = dictionary.query(number)
            words.append(word)
        }
        return words
    }
    
    func supportWords(of word: WordData, using array: [WordData]) -> [String] {
        var words: [String] = []
        var indexes: [Int] = []
        
        for index in array.indices {
            if array[index] == word {
                indexes.append(index)
                break
            }
        }
        
        for _ in 0..<3 {
            let index = randomIndex(except: indexes, max: array.count - 1)
            words.append(array[index].translate!)
            indexes.append(index)
        }
        
        return words
    }
    
    func randomIndex(except indexes: [Int], max: Int) -> Int {
        let index = Int(arc4random_uniform(UInt32(max)))
        for i in indexes {
            if i == index {
                return randomIndex(except: indexes, max: max)
            }
        }
        return index
    }
    
    func randomNumbers() -> [Int] {
        var randomNumbers: [Int] = []
        for _ in 0..<30 {
            let number = randomNumber(except: randomNumbers)
            randomNumbers.append(number)
        }
        return randomNumbers
    }
    
    func randomNumber(except numbers: [Int]) -> Int {
        let number = Int(arc4random_uniform(3094)) + 1
        if numbers.contains(number) {
            return randomNumber(except: numbers)
        } else {
            return number
        }
    }

}
