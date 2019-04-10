//
//  AddActionsExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension AddView {

    func viewDidAppear() {
        bottomConstraint = bottomAnchor.constraint(equalTo: superview!.topAnchor, constant: 0)
        topConstraint = topAnchor.constraint(equalTo: superview!.topAnchor)
        bottomConstraint.isActive = true
    }
    
    func viewWillDisappear() {
        bottomConstraint.constant = 0
        deactivateTextFields()
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.topConstraint.isActive = false
            self.bottomConstraint.isActive = true
            self.delegate?.addViewFixScrollViewContentOffset(value: 0)
            self.blurView?.frame.origin.y = 0
            self.blurView?.alpha = 0.0
            self.layoutIfNeeded()
        }, completion: { finished in
            self.removeBlurView()
        })
    }
    
    func viewDidDragging(_ contentOffset: CGFloat) {
        guard let blurView = blurView else { return }
        let offset = contentOffset * coef
        
        updateBottomConstraint(with: -offset)
        
        if contentOffset < 0 {
            blurView.updateOpacity(with: -offset / height)
            blurView.frame.origin.y = -contentOffset
        }
        
        if offset < -height {
            delegate?.addViewChangeScrollViewContentOffset(value: -height / coef)
        }
    }
    
    func viewDidEndDragging(_ contentOffset: CGFloat) {
        guard let blurView = blurView else { return }
        if Int(contentOffset * coef) == Int(-height) {
            delegate?.addViewFixScrollViewContentOffset(value: height / coef)
            updateConstraintsForOpenState()
            headerTextField.becomeFirstResponder()
        } else {
            blurView.alpha = 0.0
        }
    }
    
    @objc func didTapBlurView() {
        close()
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
            Keyboard.height = keyboardFrame.height
        }
    }
    
    @objc func textFieldDidChange(_ textField: TextField) {
        presenter.textDidChange(with: textField.text!)
        
        hideFooterTextField()
        translatesView.hide()
        buttonsView.currentModeToInit()
        addTableView.reloadData()
    }

}
