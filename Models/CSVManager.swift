//
//  CSVManager.swift
//  English
//
//  Created by Сергей Гаврилко on 07/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import CSV
import UIKit

class CSVManager: ServiceProvider {
    
    func getCSVReader(path: String, delimiter: UnicodeScalar = ",") -> CSVReader? {
        guard let filePath = Bundle.main.path(forResource: path, ofType: "csv") else { return nil }
        guard let stream = InputStream(fileAtPath: filePath) else { return nil }
        do {
            return try CSVReader(stream: stream, delimiter: delimiter)
        } catch {
            return nil
        }
    }
    
    func writeWordsFromCSVToCoreData(theme: Theme) {
        let manager = ThemeWordDataManager()
        if let csv = getCSVReader(path: "NewThemes/\(theme.filename)") {
            var count = 1
            while let row = csv.next() {
                manager.create(original: row[0], translate: row[1], theme: theme.filename, row: count)
                count += 1
            }
        }
    }
    
}

