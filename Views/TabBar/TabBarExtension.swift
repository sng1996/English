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
        buttons.map {
            $0.deactivate()
        }
    }
    
    func didTapInbox() {
        deactivateButtons()
        delegate.showInboxView()
    }
    
    func didTapRepeats() {
        deactivateButtons()
        delegate.showRepeatsView()
    }
    
    func didTapThemes() {
        deactivateButtons()
        delegate.showThemesView()
    }
    
    func didTapSettings() {
        deactivateButtons()
        delegate.showSettingsView()
    }
    
    func didTapStart() {
        delegate.start()
    }
    
    func showStartButton() {
        startButtonContainer.removeFromSuperview()
        stackView.addArrangedSubview(startButtonContainer)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
            self.startButton.alpha = 1.0
        }, completion: nil)
    }
    
    func hideStartButton() {
        startButtonContainer.removeFromSuperview()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.layoutIfNeeded()
            self.startButton.alpha = 0.0
        }, completion: nil)
    }
    
    func showBadge() {
        buttons[1].showBadge()
    }
    
    func hideBadge() {
        buttons[1].hideBadge()
    }
    
    func show() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
}
