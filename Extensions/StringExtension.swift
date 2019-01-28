//
//  StringExtension.swift
//  English
//
//  Created by Сергей Гаврилко on 22/01/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import UIKit

extension String {

    func deletePrefixSpaces() -> String {
        if self.prefix(1) != " " {
            return self
        }
        let newString = String(self.dropFirst())
        return newString.deletePrefixSpaces()
    }
    
    func deleteSuffixSpaces() -> String {
        if self.suffix(1) != " " {
            return self
        }
        let newString = String(self.dropLast())
        return newString.deleteSuffixSpaces()
    }
    
    func clearTails() -> String {
        return self.deletePrefixSpaces().deleteSuffixSpaces()
    }

}
