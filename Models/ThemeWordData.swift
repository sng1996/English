//
//  ThemeWordData.swift
//  English
//
//  Created by Сергей Гаврилко on 25/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//
//

import Foundation
import CoreData


public class ThemeWordData: NSManagedObject {

    convenience init() {
        // Описание сущности
        let entity = NSEntityDescription.entity(forEntityName: "ThemeWordData", in: ServiceProviderInstances.coreDataServiceInstance.context)
        
        // Создание нового объекта
        self.init(entity: entity!, insertInto: ServiceProviderInstances.coreDataServiceInstance.context)
    }
    
}
