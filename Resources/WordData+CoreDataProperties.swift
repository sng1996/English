//
//  WordData+CoreDataProperties.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//
//

import Foundation
import CoreData


extension WordData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordData> {
        return NSFetchRequest<WordData>(entityName: "WordData")
    }

    @NSManaged public var original: String?
    @NSManaged public var translate: String?
    @NSManaged public var translates: [Translate]?
    @NSManaged public var mode: String?
    @NSManaged public var count: Int16
    @NSManaged public var date: Date?

}
