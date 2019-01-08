//
//  ThousandsViewModel.swift
//  English
//
//  Created by Сергей Гаврилко on 07/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class ThousandsViewModel: NSObject {

    var words: [[String]] = []
    var currentIndex = 0
    
    func loadData() {
        words.removeAll()
        
        let csvManager = CSVManager()
        let array = csvManager.getThousands()
        var decimalArray: [String] = []
        
        for i in array.indices {
            decimalArray.append(array[i])
            if i % 10 == 9 {
                words.append(decimalArray)
                decimalArray = []
            }
        }
        
        print("DATA LOADED")
    }
    
    func getNumberOfItems() -> Int {
        if words.isEmpty {
            return 0
        }
        return words[currentIndex].count
    }

}
