//
//  TranslatesItemView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class TranslatesItemView: UIView {

    var sourceItem: Any? {
        didSet {
            guard let translate = sourceItem as? Translate else { return }
            posLabel.text = translate.pos
            posLabel.sizeToFit()
            trLabel.attributedText = getAttrString(translate)
        }
    }
    
    let posLabel = UILabel(
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.medium(18)
    )
    
    let trLabel = UILabel(
        color: UIColor(rgb: 0x9B9B9B),
        font: UIFont.book(18)
    )
    
    var currentIndex: Int = -1
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        addSubview(posLabel)
        addSubview(trLabel)
        
        addConstraintsWithFormat(format: "H:|[v0(45@750)]-5-[v1(1@250)]|", views: posLabel, trLabel)
        addConstraintsWithFormat(format: "V:|-5-[v0]", views: posLabel)
        addConstraintsWithFormat(format: "V:|-5-[v0]-5-|", views: trLabel)
    }
    
    func getAttrString(_ translate: Translate) -> NSAttributedString {
        var attrString: NSMutableAttributedString!
        let attrs = [
            NSAttributedString.Key.font: UIFont.medium(18),
            NSAttributedString.Key.foregroundColor: UIColor(rgb: 0x53D397)
        ]
        
        if currentIndex == 0 {
            attrString = NSMutableAttributedString(string: translate.trs[0], attributes: attrs)
        } else {
            attrString = NSMutableAttributedString(string: translate.trs[0])
        }
        for t in 1..<translate.trs.count {
            attrString.append(NSMutableAttributedString(string: ", "))
            if currentIndex == t {
                attrString.append(NSMutableAttributedString(string: translate.trs[t], attributes: attrs))
            } else {
                attrString.append(NSMutableAttributedString(string: translate.trs[t]))
            }
        }
        return attrString
    }
    
    func clear() {
        guard let translate = sourceItem as? Translate else { return }
        currentIndex = -1
        trLabel.attributedText = getAttrString(translate)
    }
    
    func setNext() {
        guard let translate = sourceItem as? Translate else { return }
        currentIndex += 1
        if currentIndex >= translate.trs.count {
            currentIndex = 0
        }
        trLabel.attributedText = getAttrString(translate)
    }
    
    func chooseWord(index: Int) {
        guard let translate = sourceItem as? Translate else { return }
        currentIndex = index
        trLabel.attributedText = getAttrString(translate)
    }
    
    func getTranslate() -> String? {
        guard let translate = sourceItem as? Translate else { return nil }
        return translate.trs[currentIndex]
    }

}
