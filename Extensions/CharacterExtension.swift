//
//  CharacterExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 08/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension Character {
    
    func unicodeScalarCodePoint() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
    
    func detectLanguage() -> String {
        let code = unicodeScalarCodePoint()
        if code >= 1072 && code <= 1103 {
            return Language.ru
        } else {
            return Language.en
        }
    }
    
}
