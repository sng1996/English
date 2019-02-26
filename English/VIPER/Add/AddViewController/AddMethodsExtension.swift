//
//  AddMethodsExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension AddViewController {

    func removeBlurView() {
        if let blurView = blurView {
            blurView.removeFromSuperview()
        }
        blurView = nil
    }
    
    func updateBottomConstraint(with value: CGFloat) {
        bottomConstraint.constant = value
        superview!.layoutIfNeeded()
    }
    
    func updateConstraintsForOpenState() {
        bottomConstraint.isActive = false
        topConstraint.isActive = true
    }
    
    func showFooterTextField(with text: String) {
        footerHeightConstraint.isActive = false
        footerTextField.text = text
    }
    
    func hideFooterTextField() {
        footerHeightConstraint.isActive = true
        footerTextField.text = ""
    }
    
    func deactivateTextFields() {
        headerTextField.resignFirstResponder()
        footerTextField.resignFirstResponder()
    }

}
