//
//  SettingsNotificationContainer.swift
//  English
//
//  Created by Сергей Гаврилко on 29/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class SettingsNotificationContainer: UIView {
    
    let headerLabel = UILabel(
        text: "Уведомления",
        font: UIFont.book(24)
    )
    
    let footerLabel = UILabel(
        text: "Включите уведомления, если хотите, чтобы мы напоминали вам о необходимости повторить слова.",
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(20)
    )
    
    let switchView: UISwitch = {
        let switchView = UISwitch()
        switchView.onTintColor = UIColor(rgb: 0x53D397)
        switchView.tintColor = UIColor(rgb: 0xE7E7E7)
        switchView.backgroundColor = UIColor(rgb: 0xE7E7E7)
        switchView.layer.cornerRadius = 15.5
        switchView.isOn = NotificationManager.instance.isOn
        return switchView
    }()
    
    let timeContainer = UIView()
    
    let timeHeaderLabel = UILabel(
        text: "Время уведомления",
        font: UIFont.book(24)
    )
    
    let timeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF8F8F8)
        view.layer.cornerRadius = 3
        view.isUserInteractionEnabled = false
        return view
    }()
    
    let timeLabel = UILabel(
        text: NotificationManager.instance.time,
        color: UIColor(rgb: 0x9A9A9A),
        font: UIFont.book(18)
    )
    
    let timePickerContainer = UIView()
    
    let timePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    let timePickerLabel: UILabel = {
        let label = UILabel(
            text: "OK",
            font: UIFont.book(20),
            alignment: .center
        )
        label.isUserInteractionEnabled = true
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        switchView.addTarget(self, action: #selector(didTapSwitch), for: .valueChanged)
        timeContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openTimePicker)))
        timePickerLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(saveTime)))
        
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(switchView)
        addSubview(timeContainer)
        addSubview(timePickerContainer)
        
        timeContainer.addSubview(timeHeaderLabel)
        timeContainer.addSubview(timeView)
        
        timeView.addSubview(timeLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]-15-[v1]|", views: headerLabel, switchView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: footerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: timeContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: timePickerContainer)
        
        addConstraintsWithFormat(format: "H:|[v0]->=15-[v1]|", views: timeHeaderLabel, timeView)
        
        addConstraintsWithFormat(format: "H:|-10-[v0]-10-|", views: timeLabel)
        
        addConstraintsWithFormat(format: "V:|[v0]-15-[v1]-20-[v2]-10-[v3]|", views: headerLabel, footerLabel, timeContainer, timePickerContainer)
        addConstraintsWithFormat(format: "V:|[v0]", views: switchView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: timeHeaderLabel)
        addConstraintsWithFormat(format: "V:|[v0]|", views: timeView)
        timeLabel.centerYAnchor.constraint(equalTo: timeView.centerYAnchor).isActive = true
    }
    
    @objc
    func didTapSwitch() {
        NotificationManager.instance.changeValue(isOn: switchView.isOn)
    }
    
    @objc
    func openTimePicker() {
        timePickerContainer.addSubview(timePicker)
        timePickerContainer.addSubview(timePickerLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: timePicker)
        addConstraintsWithFormat(format: "H:|[v0]|", views: timePickerLabel)
        addConstraintsWithFormat(format: "V:|[v0(162)][v1(40)]|", views: timePicker, timePickerLabel)
    }
    
    @objc
    func saveTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let text = formatter.string(from: timePicker.date)
        timeLabel.text = text
        NotificationManager.instance.changeTime(text)
        
        timePicker.removeFromSuperview()
        timePickerLabel.removeFromSuperview()
    }
    
}
