//
//  UILabelExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 23/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(
        text: String = "Заглушка",
        color: UIColor = .black,
        font: UIFont,
        alignment: NSTextAlignment = .left,
        lines: Int = Int.max
    ) {
        
        self.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.font = font
        self.textAlignment = alignment
        self.numberOfLines = lines
    }
    
}
