//
//  ThemeWordData+CoreDataProperties.swift
//  English
//
//  Created by Сергей Гаврилко on 25/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//
//

import Foundation
import CoreData


extension ThemeWordData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThemeWordData> {
        return NSFetchRequest<ThemeWordData>(entityName: "ThemeWordData")
    }

    @NSManaged public var original: String?
    @NSManaged public var translate: String?
    @NSManaged public var isArchive: Bool
    @NSManaged public var theme: String?
    @NSManaged public var row: Int16

}
