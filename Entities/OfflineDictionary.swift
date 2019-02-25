//
//  OfflineDictionary.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import SQLite3
import UIKit

class OfflineDictionary: NSObject {

    var database: OpaquePointer!
    
    override init() {
        super.init()
        database = openDatabase()
    }
    
    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        let filePath = Bundle.main.path(forResource: "OfflineDictionary", ofType: "sqlite")
        if sqlite3_open(filePath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(String(describing: filePath))")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
        }
        return nil
    }
    
    func query(text: String) -> [Word] {
        var words: [Word] = []
        var queryStatement: OpaquePointer?
        let queryStatementString = "SELECT * FROM Dictionary WHERE original MATCH '\(text)*' ORDER BY original;"
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            var count = 0
            while sqlite3_step(queryStatement) == SQLITE_ROW && count < 5 {
                let col1 = sqlite3_column_text(queryStatement, 0)
                let col2 = sqlite3_column_text(queryStatement, 1)
                let col4 = sqlite3_column_text(queryStatement, 3)
                
                let translates = parseTranslates(String(cString: col4!))
                
                let word = Word(
                    original: String(cString: col1!).lowercased(),
                    translate: String(cString: col2!).lowercased(),
                    translates: translates
                )
    
                words.append(word)
                count += 1
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        sqlite3_finalize(queryStatement)
        return words
    }
    
    func parseTranslates(_ tr: String) -> [Translate] {
        var translates: [Translate] = []
        let data = tr.data(using: .utf8)
        var others: [AnyObject] = []
        
        do {
            others = (try JSONSerialization.jsonObject(with: data!, options: []) as? [AnyObject])!
        } catch let error as NSError {
            print(error)
            return translates
        }
        
        for other in others {
            let translate = Translate()
            let item = other as! [AnyObject]
            translate.pos = parse(pos: (item[0] as! String))
            translate.trs = item[1] as! [String]
            translates.append(translate)
        }
        
        return translates
    }
    
    func parse(pos: String) -> String {
        switch pos {
        case "наречие": return "нар."
        case "имя существительное": return "сущ."
        case "имя прилагательное": return "прил."
        case "глагол": return "гл."
        case "местоимение": return "мест."
        case "предлог": return "пред."
        case "союз": return "союз"
        case "частица": return "част."
        case "сокращение": return "сокр."
        case "abbreviatio": return "аббр."
        default: return pos
        }
    }

}
