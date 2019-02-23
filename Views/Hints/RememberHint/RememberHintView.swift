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
        font: UIFont.book(16)
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
        
        addSubview(headerLabel)
        addSubview(notificationView)
        addSubview(acceptButton)
        addSubview(declineButton)
        addSubview(footerLabel)
    }

}
