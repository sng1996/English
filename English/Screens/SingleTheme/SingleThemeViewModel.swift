//
//  SingleThemeViewModel.swift
//  English
//
//  Created by Сергей Гаврилко on 21/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SingleThemeViewModel: ServiceProvider {
    
    var theme: Theme?
    var data: [ThemeWord] = []
    
    init() { }
    
    func loadData(theme: Theme) {
        self.theme = theme
        data.removeAll()
        
        let manager = ThemeWordDataManager()
        let words = manager.getWordsFromCoreData(theme: theme)
        
        for word in words {
            let item = ThemeWord(word)
            data.append(item)
        }
    }
    
    func getActiveCount() -> Int {
        var count = 0
        for word in data {
            if word.isActive {
                count += 1
            }
        }
        return count
    }
    
    func addActiveWords() {
        for item in data {
            if item.isActive {
                item.isActive = false
                item.data.isArchive = true
                wordDataService.createWord(original: item.data.original!, translate: item.data.translate!)
            }
        }
        if let theme = theme {
            themesService.loadCountData(theme: theme)
        }
    }
    
}
