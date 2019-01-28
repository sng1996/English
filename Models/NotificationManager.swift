//
//  NotificationManager.swift
//  English
//
//  Created by Сергей Гаврилко on 29/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UserNotifications
import UIKit

class NotificationManager: ServiceProvider {
    
    var isOn: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Keys.isOnNotification)
        }
        get {
            return UserDefaults.standard.bool(forKey: UserDefaults.Keys.isOnNotification)
        }
    }
    
    var time: String {
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.Keys.notificationTime)
        }
        get {
            if let time = UserDefaults.standard.string(forKey: UserDefaults.Keys.notificationTime) {
                return time
            }
            return "13:00"
        }
    }
    
    func changeValue(isOn: Bool) {
        self.isOn = isOn
        update()
    }
    
    func changeTime(_ time: String) {
        self.time = time
        update()
    }
    
    func update() {
        var count = 0
        var hour = 0
        var min = 0
        
        if isOn {
            count = wordDataService.todayCount
            hour = Int(time.split(separator: ":")[0])!
            min = Int(time.split(separator: ":")[1])!
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
        
        if count == 0 {
            ViewController.tabBarView.hideBadge()
            return
        }
        ViewController.tabBarView.showBadge()
        
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
