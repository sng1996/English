//
//  TranslateView.swift
//  English
//
//  Created by Сергей Гаврилко on 25/12/2018.
//  Copyright © 2018 gavrilko. All rights reserved.
//

import UIKit

protocol TranslateViewDelegate {
    func didOpenTranslateView()
    func didCloseTranslateView()
}

class TranslateView: UIView, ServiceProvider {
    
    var sourceItem: Any? {
        didSet {
            guard let word = sourceItem as? Word else { return }
            headerLabel.text = word.original
            footerLabel.text = word.translate
            translatesView.sourceItem = word
            layoutIfNeeded()
        }
    }
    
    let panLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF3F3F3)
        view.layer.cornerRadius = 2
        return view
    }()
    
    let headerLabel = UILabel(font: UIFont.book(36))
    
    let footerLabel = UILabel(font: UIFont.book(24))
    
    let translatesView = TranslatesView()
    
    let soundButton = SoundButton()
    
    let buttonsContainer = UIView()
    
    let optionsButton = TranslateOptionsButton()
    
    let deleteButton = TranslateDeleteButton()
    
    let speechManager = SpeechManager()

    var topConstraint: NSLayoutConstraint!
    
    var maxY: CGFloat = 0.0
    var currentY: CGFloat = 0.0
    var delegate: TranslateViewDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
        setupViews()
    }
    
    func setupViews() {
        deleteButton.tapHandler = deleteWord
        optionsButton.tapHandler = openButtons
        soundButton.tapHandler = playSound
        
        addSubview(panLine)
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(translatesView)
        addSubview(soundButton)
        addSubview(buttonsContainer)
        buttonsContainer.addSubview(deleteButton)
        buttonsContainer.addSubview(optionsButton)
        
        panLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            panLine.widthAnchor.constraint(equalToConstant: 30),
            panLine.heightAnchor.constraint(equalToConstant: 4),
            panLine.centerXAnchor.constraint(equalTo: centerXAnchor),
            soundButton.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -10)
        ])
        
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: headerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0][v1]|", views: footerLabel, soundButton)
        addConstraintsWithFormat(format: "H:|-\(Screen.sideInset)-[v0]-\(Screen.sideInset)-|", views: translatesView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: buttonsContainer)
        addConstraintsWithFormat(format: "V:|-[v0]-10-[v1]-3-[v2]-15-[v3][v4]-\(Screen.safeBottom / 2)-|", views: panLine, headerLabel, footerLabel, translatesView, buttonsContainer)
        addConstraintsWithFormat(format: "H:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: deleteButton)
        addConstraintsWithFormat(format: "H:|[v0]|", views: optionsButton)
        addConstraintsWithFormat(format: "V:|[v0]|", views: optionsButton)
    }
    
}
