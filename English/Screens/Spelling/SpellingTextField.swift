//
//  SpellingTextField.swift
//  English
//
//  Created by Сергей Гаврилко on 20/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

class SpellingTextField: UIView {
    
    let textField: TextField = {
        let textField = TextField()
        textField.font = UIFont.book(26)
        textField.textColor = UIColor(rgb: 0x313131)
        textField.textAlignment = .center
        textField.autocorrectionType = .no
        textField.keyboardLanguage = "en"
        return textField
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(rgb: 0xFBFBFB)
        setupViews()
    }
    
    func setupViews() {
        addSubview(textField)
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: textField)
        addConstraintsWithFormat(format: "V:|-20-[v0]-20-|", views: textField)
    }
    
}
