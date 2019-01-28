//
//  Theme.swift
//  English
//
//  Created by Сергей Гаврилко on 25/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class Theme {

    var filename: String = ""
    var name: String = ""
    var subthemes: [Theme] = []
    var countAll: Int = 0
    var countArchive: Int = 0
    
    init(filename: String, name: String, subthemes: [Theme] = []) {
        self.filename = filename
        self.name = name
        self.subthemes = subthemes
    }
    
    func getCounts() -> String {
        return "Слов добавлено: \(countArchive) из \(countAll)"
    }

}
