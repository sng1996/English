//
//  WordDataService.swift
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

class WordDataService: ServiceProvider {
    
    var newWords: [WordData] = []
    var repeatWords: [WordData] = []
    var archiveWords: [WordData] = []
    
    var todayCount = 0
    
    init() {
        loadData()
    }
    
    func createWord(original: String, translate: String, translates: [Translate] = []) {
        if original == "" || translate == "" {
            return
        }
        
        removeSimilar(original.clearTails())
        
        let wordData = WordData()
        wordData.original = original.clearTails()
        wordData.translate = translate.clearTails()
        wordData.translates = translates
        wordData.mode = WordDataMode.new
        wordData.count = 0
        wordData.date = Date()
        coreDataService.saveContext()
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
            item.word.date = Date()
        }
        coreDataService.saveContext()
        
        loadData()
    }
    
    func delete(_ wordData: WordData) {
        coreDataService.context.delete(wordData)
        coreDataService.saveContext()
        
        loadData()
    }
    
    
    ///////////////////////PRIVATE ZONE/////////////////////////////////
    
    private func loadData() {
        loadNewWords()
        loadRepeatWords()
        loadArchiveWords()
        
        let notificationService = NotificationService()
        notificationService.update()
    }
    
    private func loadNewWords() {
        newWords = getNewWordsFromCoreData()
    }
    
    private func loadRepeatWords() {
        let words = getRepeatWordsFromCoreData()
        let data = sortRepeats(words)
        repeatWords = data.0
        todayCount = data.1
    }
    
    private func loadArchiveWords() {
        archiveWords = getArchiveWordsFromCoreData()
    }
    
    private func sortRepeats(_ words: [WordData]) -> ([WordData], Int) {
        var todayWords: [WordData] = []
        var tomorrowWords: [WordData] = []
        var futureWords: [WordData] = []
        
        for word in words {
            if word.count == 0 {
                todayWords.append(word)
            } else if word.count == 1 {
                if word.date!.isToday() {
                    tomorrowWords.append(word)
                } else {
                    todayWords.append(word)
                }
            } else {
                if word.date!.isToday() || word.date!.daysAgo(1) {
                    futureWords.append(word)
                } else if word.date!.daysAgo(1) {
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
            return try coreDataService.context.fetch(fetchRequest) as! [WordData]
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
            return try coreDataService.context.fetch(fetchRequest) as! [WordData]
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
            return try coreDataService.context.fetch(fetchRequest) as! [WordData]
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
            let words = try coreDataService.context.fetch(fetchRequest) as! [WordData]
            _ = words.map { word in
                coreDataService.context.delete(word)
            }
            coreDataService.saveContext()
        } catch {
            print(error)
        }
        
        loadData()
    }

}
