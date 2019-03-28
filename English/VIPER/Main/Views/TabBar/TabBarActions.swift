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
        buttons.forEach {
            $0.isActive = false
        }
    }
    
    func didTapInbox() {
        deactivateButtons()
        delegate.didTapInboxButton()
    }
    
    func didTapRepeats() {
        deactivateButtons()
        delegate.didTapRepeatsButton()
    }
    
    func didTapThemes() {
        deactivateButtons()
        delegate.didTapThemesButton()
    }
    
    func didTapSettings() {
        deactivateButtons()
        delegate.didTapSettingsButton()
    }
    
    func didTapStart() {
        delegate.didTapStartButton()
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
        buttons[1].isBadgeActive = true
    }
    
    func hideBadge() {
        buttons[1].isBadgeActive = false
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
    
    func showHint() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.hintView.alpha = 1.0
        }, completion: { complete in
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.hideHint), userInfo: nil, repeats: false)
        })
    }
    
    @objc func hideHint() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.hintView.alpha = 0.0
        }, completion: nil)
    }
    
    func showStartHint() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.startHintView.alpha = 1.0
        }, completion: { complete in
            Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.hideStartHint), userInfo: nil, repeats: false)
        })
    }
    
    @objc func hideStartHint() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.startHintView.alpha = 0.0
        }, completion: nil)
    }
    
}
