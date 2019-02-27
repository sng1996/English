//
//  NotificationService.swift
//  English
//
//  Created by Сергей Гаврилко on 29/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UserNotifications
import UIKit

class NotificationService {
    
    var isOn: Bool! {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Keys.isOnNotification)
            update()
        }
        get {
            return UserDefaults.standard.bool(forKey: UserDefaults.Keys.isOnNotification)
        }
    }
    
    var time: String! {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Keys.notificationTime)
            update()
        }
        get {
            if let time = UserDefaults.standard.string(forKey: UserDefaults.Keys.notificationTime) {
                return time
            }
            return "13:00"
        }
    }
    
    var count: Int = 0 {
        didSet {
            update()
        }
    }
    
    init() { }
    
    private func update() {
        var count = self.count
        var hour = 0
        var min = 0
        
        if count == 0 {
            MainViewController.tabBarView.hideBadge()
        } else {
            MainViewController.tabBarView.showBadge()
        }
        
        if isOn {
            hour = Int(time.split(separator: ":")[0])!
            min = Int(time.split(separator: ":")[1])!
        } else {
            count = 0
        }
    
        updateSchedule(count, hour, min)
    }
    
    func updateSchedule(_ count: Int, _ hour: Int, _ min: Int) {
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
        }
        
        UIApplication.shared.registerForRemoteNotifications()
        UIApplication.shared.applicationIconBadgeNumber = count
        
        let content = UNMutableNotificationContent()
        content.title = "Напоминание"
        content.body = "Количество слов на сегодня: \(count)"
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = min
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }

}
