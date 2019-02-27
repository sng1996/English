////
////  SpellingView.swift
////  English
////
////  Created by Сергей Гаврилко on 27/12/2018.
////  Copyright © 2018 gavrilko. All rights reserved.
////
//
//import UIKit
//
//protocol SpellingViewDelegate {
//    func viewDidAppear()
//}
//
//class SpellingView: UIView {
//    
//    var sourceItem: Any? {
//        didSet {
//            guard let words = sourceItem as? [WordData] else { return }
//            vm.sourceItem = words
//            countLabel.text = "0 из \(words.count)"
//            textField.textField.becomeFirstResponder()
//            bottomConstraint.constant = -Keyboard.height
//            layoutIfNeeded()
//            startNextStep()
//        }
//    }
//    
//    let topContainer = UIView()
//    
//    let backButton = BackButton()
//    
//    let countLabel = UILabel(
//        text: "0 из 10",
//        color: UIColor(rgb: 0xE7E7E7),
//        font: UIFont.book(18),
//        alignment: .center
//    )
//    
//    let headerLabel = UILabel(
//        color: UIColor(rgb: 0x1A1A1A),
//        font: UIFont.book(36),
//        alignment: .center,
//        lines: 2,
//        scale: 0.5
//    )
//    
//    let button = SpellingButton()
//    
//    let footerLabel = UILabel(
//        text: "введите перевод",
//        color: UIColor(rgb: 0xCBCBCB),
//        font: UIFont.book(18),
//        alignment: .center
//    )
//    
//    let textField = SpellingTextField()
//    
//    let speechManager = SpeechManager()
//    let vm = SpellingViewModel()
//    var bottomConstraint: NSLayoutConstraint!
//    var delegate: SpellingViewDelegate!
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init() {
//        super.init(frame: .zero)
//        self.backgroundColor = .white
//        setupViews()
//    }
//    
//}
