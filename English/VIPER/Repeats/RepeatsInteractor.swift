//
//  RepeatsInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class RepeatsInteractor: ServiceProvider {
    
    weak var presenter: RepeatsPresenterProtocol!
    
    required init(presenter: RepeatsPresenterProtocol) {
        self.presenter = presenter
    }
    
}

extension RepeatsInteractor: RepeatsInteractorProtocol {

    var todayWordsCount: Int {
        get {
            return wordDataService.todayCount
        }
    }
    
    var firstWords: [WordData] {
        get {
            let count = wordDataService.todayCount < 10 ? wordDataService.todayCount : 10
            return Array(wordDataService.repeatWords.prefix(count))
        }
    }
    
    var isRepeat: Bool {
        get {
            let result = UserDefaults.standard.bool(forKey: UserDefaults.Keys.isRepeat)
            return result
        }
    }
    
    
    func itemAt(_ index: Int) -> WordData {
        return wordDataService.repeatWords[index]
    }
    
    func numberOfItems() -> Int {
        return wordDataService.repeatWords.count
    }
    
//    func requestAccessForNotifications() {
//        let notificationService = NotificationService()
//        notificationService.requestAuth()
//    }
    
}

