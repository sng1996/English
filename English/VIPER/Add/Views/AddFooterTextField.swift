//
//  AddFooterTextField.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddFooterTextField: TextField {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        placeholder = "Введите перевод"
        font = UIFont.book(18)
        textColor = .black
        autocapitalizationType = .none
        borderStyle = .none
        returnKeyType = .done
        keyboardLanguage = "ru"
    }
    
}
