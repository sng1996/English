//
//  TranslateViewDataModel.swift
//  English
//
//  Created by Сергей Гаврилко on 25/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TranslateViewDataModel {

    var original: String
    var translate: String
    var translates: [Translate]
    
    init(_ word: WordData) {
        original = word.original ?? "Пустая строка"
        translate = word.translate ?? "Пустая строка"
        translates = word.translates ?? []
    }

}
