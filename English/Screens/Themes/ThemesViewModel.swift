//
//  ThemesViewModel.swift
//  English
//
//  Created by Сергей Гаврилко on 02/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class FirstLevelTheme {
    var header: String
    var themes: [SecondLevelTheme]
    
    init(header: String, themes: [SecondLevelTheme]) {
        self.header = header
        self.themes = themes
    }
}

class SecondLevelTheme {
    var image: UIImage
    var header: String
    var themes: [ThirdLevelTheme]
    
    init(image: UIImage, header: String, themes: [ThirdLevelTheme]) {
        self.image = image
        self.header = header
        self.themes = themes
    }
}

class ThirdLevelTheme {
    var header: String
    var themeWords: [ThemeWord]
    
    init(header: String, themeWords: [ThemeWord]) {
        self.header = header
        self.themeWords = themeWords
    }
}

class ThemeWord {
    var original: String
    var translate: String
    
    init(original: String, translate: String) {
        self.original = original
        self.translate = translate
    }
}

class ThemesViewModel: NSObject {

    var colonization: ThemeWord!
    var themeWords: [ThemeWord] = []
    var third: ThirdLevelTheme!
    var thirds: [ThirdLevelTheme] = []
    var second: SecondLevelTheme!
    var seconds: [SecondLevelTheme] = []
    var first: FirstLevelTheme!
    var firsts: [FirstLevelTheme] = []
    
    override init() {
        
        colonization = ThemeWord(
            original: "colonization",
            translate: "колонизация"
        )
        
        for _ in 0..<10 {
            themeWords.append(colonization)
        }
        
        third = ThirdLevelTheme(header: "Знакомство", themeWords: themeWords)
        
        for _ in 0..<10 {
            thirds.append(third)
        }
        
        second = SecondLevelTheme(
            image: UIImage(named: "Family")!,
            header: "Семья",
            themes: thirds
        )
        
        for _ in 0..<10 {
            seconds.append(second)
        }
        
        first = FirstLevelTheme(
            header: "Отношения",
            themes: seconds
        )
        
        for _ in 0..<10 {
            firsts.append(first)
        }
        
    }

}
