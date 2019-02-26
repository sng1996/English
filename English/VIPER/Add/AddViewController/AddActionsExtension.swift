//
//  AddActionsExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension AddViewController {

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
            self.presenter.fixScrollViewContentOffset(value: 0)
            self.layoutIfNeeded()
            
            if let blurView = self.blurView {
                blurView.alpha = 0.0
            }
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
        }
        
        if offset < -height {
            presenter.changeScrollViewContentOffset(value: -height / coef)
        }
    }
    
    func viewDidEndDragging(_ contentOffset: CGFloat) {
        guard let blurView = blurView else { return }
        if Int(contentOffset * coef) == Int(-height) {
            presenter.fixScrollViewContentOffset(value: height / coef)
            updateConstraintsForOpenState()
            headerTextField.becomeFirstResponder()
        } else {
            blurView.alpha = 0.0
        }
    }
    
    @objc func didTapBlurView() {
        presenter.didTapBlurView()
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
        addTableView.hide()
        translatesView.hide()
        buttonsView.currentModeToInit()
        addTableView.reloadData()
    }

}
