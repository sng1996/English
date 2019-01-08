//
//  WordData.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//
//

import Foundation
import CoreData


public class WordData: NSManagedObject {

    convenience init() {
        // Описание сущности
        let entity = NSEntityDescription.entity(forEntityName: "WordData", in: CoreDataManager.instance.context)
        
        // Создание нового объекта
        self.init(entity: entity!, insertInto: CoreDataManager.instance.context)
    }
    
}
