//
//  TextField.swift
//  English
//
//  Created by Сергей Гаврилко on 20/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class TextField: UITextField {

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
