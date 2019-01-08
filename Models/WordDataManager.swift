//
//  WordDataManager.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import CoreData
import UIKit

enum WordDataMode {
    static let new = "NEW"
    static let repeats = "REPEAT"
    static let archive = "ARCHIVE"
}

class WordDataManager: NSObject {

    // Singleton
    static let instance = WordDataManager()
    
    var newWords: [WordData] = []
    var repeatWords: [WordData] = []
    var archiveWords: [WordData] = []
    
    var todayCount = 0
    
    private override init() {
        super.init()
        loadData()
    }
    
    func loadData() {
        loadNewWords()
        loadRepeatWords()
        loadArchiveWords()
    }
    
    func loadNewWords() {
        newWords = getNewWordsFromCoreData()
    }
    
    func loadRepeatWords() {
        let words = getRepeatWordsFromCoreData()
        let data = sortRepeats(words)
        repeatWords = data.0
        todayCount = data.1
    }
    
    func loadArchiveWords() {
        archiveWords = getArchiveWordsFromCoreData()
    }
    
    func createWord(original: String, translate: String, translates: [Translate] = []) {
        if original == "" || translate == "" {
            return
        }
        
        removeSimilar(original)
        
        let dateManager = DateManager()
        let wordData = WordData()
        wordData.original = original
        wordData.translate = translate
        wordData.translates = translates
        wordData.mode = WordDataMode.new
        wordData.count = 0
        wordData.date = dateManager.today()
        CoreDataManager.instance.saveContext()
        newWords.insert(wordData, at: 0)
    }
    
    func setRepeats(_ list: [SpellingItem]) {
        for item in list {
            if item.word.mode == WordDataMode.new {
                item.word.mode = WordDataMode.repeats
            } else {
                item.word.count += 1
                if item.word.count >= 3 && item.mistakes == 0 {
                    item.word.mode = WordDataMode.archive
                }
            }
            let dateManager = DateManager()
            item.word.date = dateManager.today()
        }
        CoreDataManager.instance.saveContext()
        
        loadData()
        NotificationManager.instance.update()
    }
    
    func delete(_ wordData: WordData) {
        CoreDataManager.instance.context.delete(wordData)
        CoreDataManager.instance.saveContext()
        
        loadData()
        NotificationManager.instance.update()
    }
    
    
    ///////////////////////PRIVATE ZONE/////////////////////////////////
    
    private func sortRepeats(_ words: [WordData]) -> ([WordData], Int) {
        var todayWords: [WordData] = []
        var tomorrowWords: [WordData] = []
        var futureWords: [WordData] = []
        
        let dataManager = DateManager()
        
        for word in words {
            if word.count == 0 {
                todayWords.append(word)
            } else if word.count == 1 {
                if word.date == dataManager.today() {
                    tomorrowWords.append(word)
                } else {
                    todayWords.append(word)
                }
            } else {
                if word.date == dataManager.today() || word.date == dataManager.daysAgo(1) {
                    futureWords.append(word)
                } else if word.date == dataManager.daysAgo(2) {
                    tomorrowWords.append(word)
                } else {
                    todayWords.append(word)
                }
            }
        }
        return (todayWords + tomorrowWords + futureWords, todayWords.count)
    }
    
    private func getNewWordsFromCoreData() -> [WordData] {
        let sort = NSSortDescriptor(key: #keyPath(WordData.date), ascending: false)
        let predicate = NSPredicate(format: "mode = '\(WordDataMode.new)'")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WordData")
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = predicate
        do {
            return try CoreDataManager.instance.context.fetch(fetchRequest) as! [WordData]
        } catch {
            print(error)
        }
        return []
    }
    
    private func getRepeatWordsFromCoreData() -> [WordData] {
        let sort = NSSortDescriptor(key: #keyPath(WordData.date), ascending: false)
        let predicate = NSPredicate(format: "mode = '\(WordDataMode.repeats)'")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WordData")
        fetchRequest.sortDescriptors = [sort]
        fetchRequest.predicate = predicate
        do {
            return try CoreDataManager.instance.context.fetch(fetchRequest) as! [WordData]
        } catch {
            print(error)
        }
        return []
    }
    
    private func getArchiveWordsFromCoreData() -> [WordData] {
        let predicate = NSPredicate(format: "mode = '\(WordDataMode.archive)'")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WordData")
        fetchRequest.predicate = predicate
        do {
            return try CoreDataManager.instance.context.fetch(fetchRequest) as! [WordData]
        } catch {
            print(error)
        }
        return []
    }
    
    private func removeSimilar(_ text: String) {
        let predicate = NSPredicate(format: "original = '\(text)'")
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WordData")
        fetchRequest.predicate = predicate
        do {
            let words = try CoreDataManager.instance.context.fetch(fetchRequest) as! [WordData]
            _ = words.map { word in
                CoreDataManager.instance.context.delete(word)
            }
            CoreDataManager.instance.saveContext()
        } catch {
            print(error)
        }
        
        loadData()
        NotificationManager.instance.update()
    }

}
