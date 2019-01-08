//
//  Word.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class Word: NSObject {
    
    var original: String
    var translate: String
    var translates: [Translate]
    var data: WordData?
    
    init(original: String, translate: String, translates: [Translate] = [], data: WordData? = nil) {
        self.original = original
        self.translate = translate
        self.translates = translates
        self.data = data
        super.init()
    }
    
    init(_ wordData: WordData) {
        self.original = wordData.original!
        self.translate = wordData.translate!
        self.translates = wordData.translates!
        self.data = wordData
        super.init()
    }
    
}
