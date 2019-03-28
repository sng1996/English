//
//  SupportDictionary.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import SQLite3
import UIKit

class SupportDictionary {

    var database: OpaquePointer!
    
    init() {
        database = openDatabase()
    }
    
    func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        let filePath = Bundle.main.path(forResource: "SupportDictionary", ofType: "sqlite")
        if sqlite3_open(filePath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(String(describing: filePath))")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
        }
        return nil
    }
    
    func query(_ id: Int) -> String {
        let queryStatementString = "SELECT * FROM HelpWords WHERE id = \(id);"
        var queryStatement: OpaquePointer? = nil
        var word: String = ""
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                let col1 = sqlite3_column_text(queryStatement, 1)
                word = String(cString: col1!)
            } else {
                print("Query returned no results")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        
        sqlite3_finalize(queryStatement)
        return word
    }
    
}
