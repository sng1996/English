//
//  RememberHintView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

protocol RememberHintViewDelegate {
    func didTapAcceptButton()
    func didTapDeclineButton()
}

class RememberHintView: UIView {
    
    let container = UIView()

    let headerLabel = UILabel(
        text: "Хотите, чтобы мы\nнапоминали вам\nо повторении слов?",
        font: UIFont.book(32),
        alignment: .center
    )
    
    let notificationView = NotificationHintView()
    
    let acceptButton = RememberHintButton()
    
    let declineButton = RememberHintDeclineButton()
    
    let footerLabel = UILabel(
        text: "Вы сможете настроить время уведомлений,\nлибо отключить их в разделе настройки.",
        color: UIColor(rgb: 0xCECECE),
        font: UIFont.book(16),
        alignment: .center
    )
    
    var delegate: RememberHintViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        acceptButton.tapHandler = delegate.didTapAcceptButton
        declineButton.tapHandler = delegate.didTapDeclineButton
        
        addSubview(container)
        addSubview(footerLabel)
        container.addSubview(headerLabel)
        container.addSubview(notificationView)
        container.addSubview(acceptButton)
        container.addSubview(declineButton)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: container)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:[v0]-\(44 * Screen.heightCoef)-|", views: footerLabel)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: notificationView)
        addConstraintsWithFormat(format: "V:|[v0]-\(40 * Screen.heightCoef)-[v1]-\(60 * Screen.heightCoef)-[v2]-5-[v3]|", views: headerLabel, notificationView, acceptButton, declineButton)
        
        NSLayoutConstraint.activate([
            acceptButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            declineButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

}
