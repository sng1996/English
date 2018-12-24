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
    func showSettingsView()
    func showThousandsView()
    func showThemesView()
    func showProsesView()
    func start()
}

class TabBarView: UIView {
    
    var height: CGFloat {
        switch Screen.type {
        case .iphone5, .iphone8, .iphonePlus, .ipad97, .ipad105, .ipad129:
            return 70
        case .iphoneX, .iphoneMax:
            return 84
        }
    }
    
    let line = Line()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let modulesView = TabBarModulesView()
    
    let startButton = TabBarStartButton()
    
    var buttons: [Button] = [
        TabBarButton(item: TabBarButtonType.inbox),
        TabBarButton(item: TabBarButtonType.repeats),
        TabBarButton(item: TabBarButtonType.modules),
        TabBarButton(item: TabBarButtonType.settings)
    ]
    
    var delegate: TabBarViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
}
