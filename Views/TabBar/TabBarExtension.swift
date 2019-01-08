//
//  TabBarExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension TabBarView {
    
    func deactivateButtons() {
        for button in buttons {
            if let button = button as? TabBarButton {
                button.deactivate()
            }
        }
    }
    
    func didTapInbox() {
        modulesView.isHidden = true
        modulesView.deactivateButtons()
        deactivateButtons()
        delegate.showInboxView()
    }
    
    func didTapRepeats() {
        modulesView.isHidden = true
        modulesView.deactivateButtons()
        deactivateButtons()
        delegate.showRepeatsView()
    }
    
    func didTapModules() {
        modulesView.isHidden = false
        deactivateButtons()
    }
    
    func didTapSettings() {
        modulesView.isHidden = true
        modulesView.deactivateButtons()
        deactivateButtons()
        delegate.showSettingsView()
    }
    
    func didTapThousands() {
        modulesView.isHidden = true
        delegate.showThousandsView()
    }
    
    func didTapThemes() {
        modulesView.isHidden = true
        delegate.showThemesView()
    }
    
    func didTapProse() {
        modulesView.isHidden = true
        delegate.showProsesView()
    }
    
    func didTapStart() {
        modulesView.isHidden = true
        delegate.start()
    }
    
    func showStartButton() {
        startButton.removeFromSuperview()
        stackView.addArrangedSubview(startButton)
    }
    
    func hideStartButton() {
        startButton.removeFromSuperview()
    }
    
}
