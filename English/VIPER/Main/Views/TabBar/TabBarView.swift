//
//  TabBarView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TabBarViewDelegate {
    func didTapInboxButton()
    func didTapRepeatsButton()
    func didTapThemesButton()
    func didTapSettingsButton()
    func didTapStartButton()
}

class TabBarView: UIView {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let startButton = TabBarStartButton()
    let startButtonContainer = UIView()
    
    var buttons: [TabBarButton] = [
        TabBarButton(item: TabBarButtonType.inbox),
        TabBarButton(item: TabBarButtonType.repeats),
        TabBarButton(item: TabBarButtonType.themes),
        TabBarButton(item: TabBarButtonType.settings)
    ]
    
    let height: CGFloat = 60 + Screen.safeBottom / 2
    var delegate: TabBarViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
}
