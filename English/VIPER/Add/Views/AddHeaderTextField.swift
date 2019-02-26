//
//  AddHeaderTextField.swift
//  English
//
//  Created by Сергей Гаврилко on 26/02/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class AddHeaderTextField: TextField {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        placeholder = "Введите слово или фразу"
        font = UIFont.book(22)
        textColor = .black
        autocapitalizationType = .none
        borderStyle = .none
        returnKeyType = .done
        clearButtonMode = .whileEditing
    }
    
}
