//
//  ThemeWordDataService.swift
//  English
//
//  Created by Сергей Гаврилко on 25/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import CoreData
import UIKit

class ThemeWordDataManager: ServiceProvider {
    
    func create(original: String, translate: String, theme: String, row: Int) {
        let word = ThemeWordData()
        word.original = original
        word.translate = translate
        word.theme = theme
        word.row = Int16(row)
    }

    func getWordsFromCoreData(theme: Theme) -> [ThemeWordData] {
        let sort = NSSortDescriptor(key: #keyPath(ThemeWordData.row), ascending: true)
        let predicate = NSPredicate(format: "theme = '\(theme.filename)'")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ThemeWordData")
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = predicate
        do {
            return try coreDataService.context.fetch(fetchRequest) as! [ThemeWordData]
        } catch {
            print(error)
        }
        return []
    }
    
    func getAllWordsCountFromCoreData(theme: Theme) -> Int {
        let predicate = NSPredicate(format: "theme = '\(theme.filename)'")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ThemeWordData")
        fetchRequest.predicate = predicate
        do {
            return try coreDataService.context.count(for: fetchRequest)
        } catch {
            print(error)
        }
        return 0
    }
    
    func getArchiveWordsCountFromCoreData(theme: Theme) -> Int {
        let predicate = NSPredicate(format: "theme = '\(theme.filename)' AND isArchive = 1")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ThemeWordData")
        fetchRequest.predicate = predicate
        do {
            return try coreDataService.context.count(for: fetchRequest)
        } catch {
            print(error)
        }
        return 0
    }

}
