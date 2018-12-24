//
//  AddViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 24/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension AddView {
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == headerTextView {
            headerDidChange(textView)
        } else {
            footerDidChange(textView)
        }
    }
    
    func headerDidChange(_ textView: UITextView) {
        footerTextView.text = textView.text
    }
    
    func footerDidChange(_ textView: UITextView) {
        
    }
    
    func hideFooter() {
        heightConstraint.isActive = true
    }
    
    func showFooter() {
        heightConstraint.isActive = false
    }
    
    func activateKeyboard() {
        headerTextView.becomeFirstResponder()
    }
    
    func close() {
        layoutIfNeeded()
        if let blurView = blurView {
            blurView.alpha = 0.0
            blurView.container.alpha = 0.0
        }
        
    }
    
}
