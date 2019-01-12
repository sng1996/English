//
//  SpellingView.swift
//  English
//
//  Created by Сергей Гаврилко on 27/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UITextView_Placeholder
import UIKit

protocol SpellingViewDelegate {
    func viewDidAppear()
}

class SpellingView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let words = sourceItem as? [WordData] else { return }
            vm.sourceItem = words
            textView.becomeFirstResponder()
            bottomConstraint.constant = -Keyboard.height - 20.0
            layoutIfNeeded()
            startNextStep()
        }
    }
    
    let topContainer = UIView()
    
    let backButton = BackButton()
    
    let countLabel = UILabel(
        text: "0 из 10",
        color: UIColor(rgb: 0xE7E7E7),
        font: UIFont.book(18),
        alignment: .right
    )
    
    let headerLabel: UILabel = {
        let label = UILabel(
            color: UIColor(rgb: 0x1A1A1A),
            font: UIFont.book(36),
            alignment: .center
        )
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    let textView: TextView = {
        let textView = TextView()
        textView.text = ""
        textView.placeholder = "Введите перевод"
        textView.placeholderColor = UIColor(rgb: 0xCBCBCB)
        textView.tintColor = .clear
        textView.font = UIFont.book(30)
        textView.textColor = .black
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.autocorrectionType = .no
        textView.keyboardLanguage = "en"
        textView.autocapitalizationType = .none
        return textView
    }()
    
    let button = SpellingButton()
    
    let speechManager = SpeechManager()
    let vm = SpellingViewModel()
    var bottomConstraint: NSLayoutConstraint!
    var delegate: SpellingViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupViews()
    }
    
}
