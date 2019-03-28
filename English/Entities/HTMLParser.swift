//
//  HTMLParser.swift
//  English
//
//  Created by Сергей Гаврилко on 28/03/2019.
//  Copyright © 2019 gavrilko. All rights reserved.
//

import SwiftSoup
import UIKit

class HTMLParser {

    func parse(_ text: String) -> String {
        do {
            let str = text.replacingOccurrences(of: "<br>", with: "$@")
            let doc: Document = try SwiftSoup.parse(str)
            let element = try doc.getElementsByClass("lyrics").first()!
            let newText = try element.text()
            let newStr = newText.replacingOccurrences(of: "$@", with: "\n")
            return newStr
        } catch {
            print("Error")
        }
        return ""
    }

}
