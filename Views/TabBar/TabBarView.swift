//
//  TabBarView.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TabBarViewDelegate {
    func showInboxView()
    func showRepeatsView()
    func showThemesView()
    func showSettingsView()
    func start()
}

class TabBarView: ShadowsView {
    
    let height: CGFloat = 60
    
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
    
    var delegate: TabBarViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init() {
        super.init()
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor(rgb: 0x5BD49B, a: 0.04).cgColor
        set(shadows: setupShadows())
        set(cornerRadius: 5)
        setupViews()
    }
    
}
