//
//  InboxInteractor.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class InboxInteractor: ServiceProvider {

    weak var presenter: InboxPresenterProtocol!
    
    required init(presenter: InboxPresenterProtocol) {
        self.presenter = presenter
    }

}

extension InboxInteractor: InboxInteractorProtocol {
    
    var numberOfItems: Int {
        get {
            return wordDataService.newWords.count
        }
    }
    
    var firstWords: [WordData] {
        get {
            return Array(wordDataService.newWords.prefix(10))
        }
    }
    
    var isShowNotificationHint: Bool {
        get {
            let result = UserDefaults.standard.bool(forKey: UserDefaults.Keys.isShowNotificationHint)
            UserDefaults.standard.set(true, forKey: UserDefaults.Keys.isShowNotificationHint)
            return result
        }
    }
    
    func itemAt(_ index: Int) -> WordData {
        return wordDataService.newWords[index]
    }
    
    func requestAccessForNotifications() {
        let notificationService = NotificationService()
        notificationService.requestAuth()
    }
    
}
