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
        currentButton.deactivate()
    }
    
    func didTapInbox() {
        modulesView.deactivateButtons()
        deactivateButtons()
        delegate.showInboxView()
        currentButton = buttons[0]
        hideModulesView()
    }
    
    func didTapRepeats() {
        modulesView.deactivateButtons()
        deactivateButtons()
        delegate.showRepeatsView()
        currentButton = buttons[1]
        hideModulesView()
    }
    
    func didTapModules() {
        showModulesView()
        deactivateButtons()
    }
    
    func didTapSettings() {
        modulesView.deactivateButtons()
        deactivateButtons()
        delegate.showSettingsView()
        currentButton = buttons[3]
        hideModulesView()
    }
    
    func didTapThousands() {
        delegate.showThousandsView()
        currentButton = buttons[2]
        hideModulesView()
    }
    
    func didTapThemes() {
        delegate.showThemesView()
        currentButton = buttons[2]
        hideModulesView()
    }
    
    func didTapProse() {
        delegate.showProsesView()
        currentButton = buttons[2]
        hideModulesView()
    }
    
    func didTapStart() {
        hideModulesView()
        delegate.start()
    }
    
    func showStartButton() {
        startButton.removeFromSuperview()
        stackView.addArrangedSubview(startButton)
    }
    
    func hideStartButton() {
        startButton.removeFromSuperview()
    }
    
    func showModulesView() {
        closeModulesView.isHidden = false
        modulesView.isHidden = false
    }
    
    @objc
    func hideModulesView() {
        closeModulesView.isHidden = true
        modulesView.isHidden = true
        buttons[2].deactivate()
        currentButton.activate()
    }
    
    func showBadge() {
        buttons[1].showBadge()
    }
    
    func hideBadge() {
        buttons[1].hideBadge()
    }
    
}
