//
//  TextView.swift
//  English
//
//  Created by Сергей Гаврилко on 08/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TextView: UITextView {

    var keyboardLanguage: String = "en"
    
    override var textInputMode: UITextInputMode? {
        for tim in UITextInputMode.activeInputModes {
            if tim.primaryLanguage!.contains(keyboardLanguage) {
                return tim
            }
        }
        return super.textInputMode
    }

}
