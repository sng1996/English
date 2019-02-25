//
//  Translate.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

public class Translate: NSObject, NSCoding {
    
    var pos: String = ""
    var trs: [String] = []
    
    override init() {}
    
    init(pos: String, trs: [String]) {
        self.pos = pos
        self.trs = trs
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.pos, forKey: "pos")
        aCoder.encode(self.trs, forKey: "trs")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let pos = aDecoder.decodeObject(forKey: "pos") as? String {
            self.pos = pos
        }
        if let trs = aDecoder.decodeObject(forKey: "trs") as? [String] {
            self.trs = trs
        }
    }
}
