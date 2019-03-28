//
//  DateExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 09/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension Date {

    func isToday() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let todayString = formatter.string(from: Date())
        let selfString = formatter.string(from: self)
        return todayString == selfString
    }
    
    func daysAgo(_ num: Double) -> Bool {
        let date = Date().addingTimeInterval(-num * 24.0 * 60.0 * 60.0)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let targetString = formatter.string(from: date)
        let selfString = formatter.string(from: self)
        return targetString == selfString
    }

}
