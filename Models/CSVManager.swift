//
//  CSVManager.swift
//  English
//
//  Created by Сергей Гаврилко on 07/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import CSV
import UIKit

class CSVManager: NSObject {
    
    func getCSVReader(path: String, delimiter: UnicodeScalar = ",") -> CSVReader? {
        guard let filePath = Bundle.main.path(forResource: path, ofType: "csv") else { return nil }
        guard let stream = InputStream(fileAtPath: filePath) else { return nil }
        do {
            return try CSVReader(stream: stream, delimiter: delimiter)
        } catch {
            return nil
        }
    }
    
//    func getProseHeaders() -> [ProseHeader]? {
//        var proseHeaders: [ProseHeader] = []
//        guard let csv = getCSVReader(path: "ProsesSource/Proses") else {
//            return nil
//        }
//
//        while let row = csv.next() {
//            let proseHeader = ProseHeader(
//                name: row[0],
//                author: row[1],
//                type: row[2]
//            )
//            proseHeaders.append(proseHeader)
//        }
//
//        return proseHeaders.isEmpty ? nil : proseHeaders
//    }
//
//    func getProseText(_ name: String) -> String? {
//        if let url = Bundle.main.url(forResource: "ProsesSource/\(name)", withExtension: "csv") {
//            do {
//                return try String(contentsOf: url, encoding: .utf8)
//            }
//            catch {}
//        }
//        return nil
//    }
    
    func getThousands() -> [String] {
        var thousands: [String] = []
        guard let csv = getCSVReader(path: "csv/thousands") else {
            return []
        }
        
        while let row = csv.next() {
            thousands.append(row[0])
        }
        return thousands
    }
    
}

