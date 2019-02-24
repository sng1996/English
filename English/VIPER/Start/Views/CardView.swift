//
//  CardView.swift
//  English
//
//  Created by Сергей Гаврилко on 26/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

class CardViewDataModel {
    
    var original: String
    var translate: String
    
    init(_ word: WordData) {
        original = word.original ?? "Пустая строка"
        translate = word.translate ?? "Пустая строка"
    }
    
}

class CardView: UIView {
    
    var sourceItem: Any? {
        didSet {
            guard let model = sourceItem as? CardViewDataModel else { return }
            headerLabel.text = model.original
            footerLabel.text = model.translate
        }
    }

    let headerLabel = UILabel(
        color: UIColor(rgb: 0x030303),
        font: UIFont.book(36),
        alignment: .center
    )
    
    let footerLabel = UILabel(
        color: UIColor(rgb: 0xDADADA),
        font: UIFont.book(24),
        alignment: .center
    )
    
    let soundButton = SoundButton()
    
    let speechManager = SpeechManager()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 3
        isUserInteractionEnabled = true
        layer.setShadow(
            offset: .zero,
            opacity: 0.05,
            radius: 14
        )
        frame.size = CGSize(
            width: Screen.width - 2 * Screen.sideInset,
            height: 414 * Screen.heightCoef
        )
        
        soundButton.tapHandler = playSound
        
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(soundButton)
        
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: headerLabel)
        addConstraintsWithFormat(format: "H:|-20-[v0]-20-|", views: footerLabel)
        addConstraintsWithFormat(format: "V:|-(>=10)-[v0]", views: headerLabel)
        addConstraintsWithFormat(format: "V:[v0]-[v1]-(>=10)-|", views: footerLabel, soundButton)
        
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            footerLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            soundButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func playSound() {
        if let word = sourceItem as? WordData {
            speechManager.play(word.original!)
        }
    }
    
}
