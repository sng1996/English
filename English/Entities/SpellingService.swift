//
//  SpellingService.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingItem: Equatable {
    
    var wordData: WordData
    var isMadeMistake = false
    var sortIndex = Int(arc4random_uniform(1000))
    
    static func == (lhs: SpellingItem, rhs: SpellingItem) -> Bool {
        return lhs.wordData == rhs.wordData
    }
    
    init(data: WordData) {
        wordData = data
    }
}

class SpellingService {

    func data(for array: [WordData]) -> [SpellingItem] {
        var spellingItems: [SpellingItem] = []
        for word in array {
            let spellingItem = SpellingItem(data: word)
            spellingItems.append(spellingItem)
        }
        spellingItems.sort { $0.sortIndex < $1.sortIndex }
        return spellingItems
    }
    
    func removeDuplicates(for array: [SpellingItem]) -> [SpellingItem] {
        var spellingItemList: [SpellingItem] = []
        for item in array {
            if !spellingItemList.contains(item) {
                spellingItemList.append(item)
            }
        }
        return spellingItemList
    }

}
