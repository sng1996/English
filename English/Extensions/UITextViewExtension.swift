//
//  UITextViewExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension UITextView {
    
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
}
