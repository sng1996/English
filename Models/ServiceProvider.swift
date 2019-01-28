//
//  ServiceProvider.swift
//  English
//
//  Created by Сергей Гаврилко on 12/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

struct ServiceProviderInstances {
    static let coreDataServiceInstance = CoreDataService()
    static let wordDataServiceInstance = WordDataService()
    static let themesServiceInstance = ThemesService()
}

protocol ServiceProvider {
    var coreDataService: CoreDataService { get }
    var wordDataService: WordDataService { get }
    var themesService: ThemesService { get }
}

extension ServiceProvider {
    var coreDataService: CoreDataService {
        return ServiceProviderInstances.coreDataServiceInstance
    }
    var wordDataService: WordDataService {
        return ServiceProviderInstances.wordDataServiceInstance
    }
    var themesService: ThemesService {
        return ServiceProviderInstances.themesServiceInstance
    }
}
